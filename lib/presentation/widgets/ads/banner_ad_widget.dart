import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/core/constants/ad_constants.dart';
import 'package:holiday_calendar/presentation/providers/ad_provider.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';

class BannerAdWidget extends ConsumerWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!AdConstants.isAdSupported) {
      return const SizedBox.shrink();
    }

    final shouldShowAds = ref.watch(shouldShowAdsProvider);

    if (!shouldShowAds) {
      return const SizedBox.shrink();
    }

    final bannerAd = ref.watch(bannerAdNotifierProvider);

    if (bannerAd == null) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
  }
}

/// Ad Banner Container with "Anzeige" label
/// Design requirement: Clear separation from content with label
class AdBannerContainer extends ConsumerWidget {
  const AdBannerContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!AdConstants.isAdSupported) {
      return const SizedBox.shrink();
    }

    final shouldShowAds = ref.watch(shouldShowAdsProvider);

    if (!shouldShowAds) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Container(
        color: theme.colorScheme.surfaceContainerHighest,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Anzeige label
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Anzeige',
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ),
            // Ad Banner
            const BannerAdWidget(),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
