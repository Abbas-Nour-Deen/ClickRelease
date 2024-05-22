class CertificationModel {
  DateTime certificationDate;
  String certificationName;

  CertificationModel({
    required this.certificationDate,
    required this.certificationName,
  });

  factory CertificationModel.fromJson(Map<String, dynamic> json) {
    return CertificationModel(
      certificationDate: DateTime.parse(json['certificationDate']),
      certificationName: json['certificationName'],
    );
  }
}
