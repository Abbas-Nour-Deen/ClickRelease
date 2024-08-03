class ServiceModel {
  final String serviceId;
  final String catId;
  final String nameEn;
  final String descr;
  final String nameAr;

  ServiceModel({
    required this.serviceId,
    required this.catId,
    required this.nameEn,
    required this.descr,
    required this.nameAr,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceId: json['serviceId'],
      catId: json['catId'] ?? '',
      nameEn: json['serviceNameEng'] ?? '',
      descr: json['description'] ?? '',
      nameAr: json['serviceNameArb'] ?? '',
    );
  }
}
