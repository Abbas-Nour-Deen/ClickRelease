class ZoneModel {
  String zoneId;
  String nameEng;
  String nameArb;

  ZoneModel({
    required this.zoneId,
    required this.nameEng,
    required this.nameArb,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
      zoneId: json['zoneId'],
      nameEng: json['nameEng'],
      nameArb: json['nameArb'],
    );
  }
}
