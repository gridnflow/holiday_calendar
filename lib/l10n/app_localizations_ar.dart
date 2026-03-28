// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'عطلات ألمانيا';

  @override
  String get holidays => 'العطلات';

  @override
  String get bridgeDays => 'أيام الجسر';

  @override
  String get allStates => 'جميع الولايات الفيدرالية';

  @override
  String get state => 'الولاية الفيدرالية';

  @override
  String get year => 'السنة';

  @override
  String get month => 'الشهر';

  @override
  String get refresh => 'تحديث';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get errorOccurred => 'حدث خطأ';

  @override
  String get noHolidaysFound => 'لم يتم العثور على عطلات';

  @override
  String get noBridgeDaysFound => 'لم يتم العثور على أيام جسر';

  @override
  String get vacationDays => 'أيام الإجازة';

  @override
  String get daysOff => 'أيام إجازة';

  @override
  String get efficiency => 'الكفاءة';

  @override
  String get vacationRecommendation => 'توصية الإجازة';

  @override
  String get vacationDaysNeeded => 'أيام الإجازة المطلوبة';

  @override
  String get totalDaysOff => 'إجمالي أيام الإجازة';

  @override
  String get relatedHolidays => 'العطلات المرتبطة';

  @override
  String get veryGood => 'ممتاز';

  @override
  String get good => 'جيد';

  @override
  String get okay => 'مقبول';

  @override
  String get low => 'منخفض';

  @override
  String get january => 'يناير';

  @override
  String get february => 'فبراير';

  @override
  String get march => 'مارس';

  @override
  String get april => 'أبريل';

  @override
  String get may => 'مايو';

  @override
  String get june => 'يونيو';

  @override
  String get july => 'يوليو';

  @override
  String get august => 'أغسطس';

  @override
  String get september => 'سبتمبر';

  @override
  String get october => 'أكتوبر';

  @override
  String get november => 'نوفمبر';

  @override
  String get december => 'ديسمبر';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days يوم إجازة ← $total يوم عطلة';
  }
}
