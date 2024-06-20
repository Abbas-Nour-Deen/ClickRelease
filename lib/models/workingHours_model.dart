class WorkingHoursModel {
  String start;
  String end;
  String day;

  WorkingHoursModel({
    required this.start,
    required this.end,
    required this.day,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkingHoursModel(
      start: json['start'],
      end: json['end'],
      day: json['day'],
    );
  }
}
