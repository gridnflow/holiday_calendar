import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/core/constants/ad_constants.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';

/// Native Ad Widget that blends with app content
/// Styled to match the Brückentage cards design
class NativeAdWidget extends ConsumerStatefulWidget {
  const NativeAdWidget({super.key});

  @override
  ConsumerState<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends ConsumerState<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    if (!AdConstants.isAdSupported) return;

    _nativeAd = NativeAd(
      adUnitId: AdConstants.nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (mounted) {
            setState(() {
              _nativeAd = null;
              _isAdLoaded = false;
            });
          }
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.small,
        mainBackgroundColor: Colors.transparent,
        cornerRadius: 12,
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 14,
          style: NativeTemplateFontStyle.bold,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          size: 14,
          style: NativeTemplateFontStyle.bold,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          size: 12,
          style: NativeTemplateFontStyle.normal,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          size: 10,
          style: NativeTemplateFontStyle.normal,
        ),
      ),
    );

    _nativeAd?.load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!AdConstants.isAdSupported) {
      return const SizedBox.shrink();
    }

    final shouldShowAds = ref.watch(shouldShowAdsProvider);
    if (!shouldShowAds) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    if (!_isAdLoaded || _nativeAd == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Anzeige label (German advertising requirement)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Anzeige',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontSize: 10,
              ),
            ),
          ),
          // Native Ad Container
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(
              minHeight: 90,
              maxHeight: 120,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AdWidget(ad: _nativeAd!),
            ),
          ),
        ],
      ),
    );
  }
}
