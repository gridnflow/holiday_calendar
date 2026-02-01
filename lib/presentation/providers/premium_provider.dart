import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'premium_provider.g.dart';

const String _premiumKey = 'is_premium_user';

@riverpod
class PremiumStatus extends _$PremiumStatus {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_premiumKey) ?? false;
  }

  Future<void> setPremium(bool isPremium) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumKey, isPremium);
    ref.invalidateSelf();
  }

  Future<void> upgrade() async {
    await setPremium(true);
  }

  Future<void> downgrade() async {
    await setPremium(false);
  }
}

@riverpod
bool shouldShowAds(Ref ref) {
  final premiumAsync = ref.watch(premiumStatusProvider);
  return premiumAsync.when(
    data: (isPremium) => !isPremium,
    loading: () => false,
    error: (_, _) => true,
  );
}
