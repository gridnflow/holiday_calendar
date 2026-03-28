class Vacation {
  final int id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  const Vacation({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  int get durationDays => endDate.difference(startDate).inDays + 1;

  bool includesDate(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    final s = DateTime(startDate.year, startDate.month, startDate.day);
    final e = DateTime(endDate.year, endDate.month, endDate.day);
    return !d.isBefore(s) && !d.isAfter(e);
  }
}
