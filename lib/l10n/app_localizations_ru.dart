// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Праздники Германии';

  @override
  String get holidays => 'Праздники';

  @override
  String get bridgeDays => 'Мостовые дни';

  @override
  String get allStates => 'Все федеральные земли';

  @override
  String get state => 'Федеральная земля';

  @override
  String get year => 'Год';

  @override
  String get month => 'Месяц';

  @override
  String get refresh => 'Обновить';

  @override
  String get retry => 'Повторить';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get noHolidaysFound => 'Праздники не найдены';

  @override
  String get noBridgeDaysFound => 'Мостовые дни не найдены';

  @override
  String get vacationDays => 'Дни отпуска';

  @override
  String get daysOff => 'Выходных дней';

  @override
  String get efficiency => 'Эффективность';

  @override
  String get vacationRecommendation => 'Рекомендация по отпуску';

  @override
  String get vacationDaysNeeded => 'Требуется дней отпуска';

  @override
  String get totalDaysOff => 'Всего выходных дней';

  @override
  String get relatedHolidays => 'Связанные праздники';

  @override
  String get veryGood => 'Отлично';

  @override
  String get good => 'Хорошо';

  @override
  String get okay => 'Нормально';

  @override
  String get low => 'Низкая';

  @override
  String get january => 'Январь';

  @override
  String get february => 'Февраль';

  @override
  String get march => 'Март';

  @override
  String get april => 'Апрель';

  @override
  String get may => 'Май';

  @override
  String get june => 'Июнь';

  @override
  String get july => 'Июль';

  @override
  String get august => 'Август';

  @override
  String get september => 'Сентябрь';

  @override
  String get october => 'Октябрь';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days дн. отпуска → $total выходных';
  }
}
