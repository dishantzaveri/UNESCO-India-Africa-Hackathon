class DateSchedule {
  final String title;
  final String subtitle;
  final String start;
  final String end;
  bool isSelected;

  DateSchedule({
    required this.subtitle,
    required this.title,
    this.isSelected = false,
    required this.start,
    required this.end,
  });
}
