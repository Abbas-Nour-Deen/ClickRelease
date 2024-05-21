class ProjectModel {
  final String provID;
  final String projectDesc;
  final DateTime entryDate;

  ProjectModel(
      {required this.provID,
      required this.projectDesc,
      required this.entryDate});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      provID: json['provID'] ?? "",
      projectDesc: json['projectDesc'] ?? "",
      entryDate: DateTime.parse(json['EntryDate']) ?? DateTime.now(),
    );
  }
}
