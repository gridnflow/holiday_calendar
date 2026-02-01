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
    // 웹/데스크톱에서는 광고 미지원
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

class AdContainer extends StatelessWidget {
  final Widget child;

  const AdContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: child,
    );
  }
}
