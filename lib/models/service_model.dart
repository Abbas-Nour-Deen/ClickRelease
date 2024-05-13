import 'dart:typed_data';

class ServiceModel {
  final String serviceId;
  final String catId;
  final String nameEn;
  final String descr;
  final Uint8List image;
  final String nameAr;

  ServiceModel({
    required this.serviceId,
    required this.catId,
    required this.nameEn,
    required this.descr,
    required this.image,
    required this.nameAr,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['serviceIcon']['data'];
    List<int> bytes = data.cast<int>();
    return ServiceModel(
      serviceId: json['serviceId'],
      catId: json['catId'] ?? '',
      nameEn: json['serviceNameEng'] ?? '',
      descr: json['description'] ?? '',
      image: Uint8List.fromList(bytes),
      nameAr: json['serviceNameArb'] ?? '',
    );
  }
}
