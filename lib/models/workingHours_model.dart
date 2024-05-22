class WorkingHoursModel {
  String provID;
  String start;
  String end;
  String day;

  WorkingHoursModel({
    required this.provID,
    required this.start,
    required this.end,
    required this.day,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkingHoursModel(
      provID: json['provID'],
      start: json['start'],
      end: json['end'],
      day: json['Day'],
    );
  }
}
