import 'dart:typed_data';

class CategoryModel {
  final String categoryID;
  final String nameEn;
  final String descr;
  final Uint8List image;
  final String nameAr;

  CategoryModel({
    required this.categoryID,
    required this.nameEn,
    required this.descr,
    required this.image,
    required this.nameAr,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['icon']['data'];
    List<int> bytes = data.cast<int>();
    return CategoryModel(
      categoryID: json['catId'] ?? '',
      nameEn: json['catNameEng'] ?? '',
      descr: json['description'] ?? '',
      image: Uint8List.fromList(bytes),
      nameAr: json['catNameArb'] ?? '',
    );
  }
}
