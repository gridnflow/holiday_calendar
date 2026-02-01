import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/core/constants/ad_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_provider.g.dart';

@riverpod
class BannerAdNotifier extends _$BannerAdNotifier {
  BannerAd? _bannerAd;

  @override
  BannerAd? build() {
    _loadAd();
    ref.onDispose(() {
      _bannerAd?.dispose();
    });
    return null;
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdConstants.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          state = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          state = null;
        },
      ),
    )..load();
  }

  void reload() {
    _bannerAd?.dispose();
    state = null;
    _loadAd();
  }
}
