// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Almanya Tatilleri';

  @override
  String get holidays => 'Tatiller';

  @override
  String get bridgeDays => 'Köprü Günler';

  @override
  String get allStates => 'Tüm Federal Eyaletler';

  @override
  String get state => 'Federal Eyalet';

  @override
  String get year => 'Yıl';

  @override
  String get month => 'Ay';

  @override
  String get refresh => 'Yenile';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get errorOccurred => 'Hata oluştu';

  @override
  String get noHolidaysFound => 'Tatil bulunamadı';

  @override
  String get noBridgeDaysFound => 'Köprü gün bulunamadı';

  @override
  String get vacationDays => 'İzin günleri';

  @override
  String get daysOff => 'Tatil günü';

  @override
  String get efficiency => 'Verimlilik';

  @override
  String get vacationRecommendation => 'İzin önerisi';

  @override
  String get vacationDaysNeeded => 'Gereken izin günü';

  @override
  String get totalDaysOff => 'Toplam tatil günü';

  @override
  String get relatedHolidays => 'İlgili tatiller';

  @override
  String get veryGood => 'Çok iyi';

  @override
  String get good => 'İyi';

  @override
  String get okay => 'Fena değil';

  @override
  String get low => 'Düşük';

  @override
  String get january => 'Ocak';

  @override
  String get february => 'Şubat';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Nisan';

  @override
  String get may => 'Mayıs';

  @override
  String get june => 'Haziran';

  @override
  String get july => 'Temmuz';

  @override
  String get august => 'Ağustos';

  @override
  String get september => 'Eylül';

  @override
  String get october => 'Ekim';

  @override
  String get november => 'Kasım';

  @override
  String get december => 'Aralık';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days izin günü → $total gün tatil';
  }
}
