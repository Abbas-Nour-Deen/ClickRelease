class CategoryModel {
  final String categoryID;
  final String nameEn;
  final String descr;
  final String image;
  final String nameAr;

  CategoryModel({
    required this.categoryID,
    required this.nameEn,
    required this.descr,
    required this.image,
    required this.nameAr,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryID: json['catId'] ?? '',
      nameEn: json['catNameEng'] ?? '',
      descr: json['description'] ?? '',
      image: json['icon'],
      nameAr: json['catNameArb'] ?? '',
    );
  }
}
