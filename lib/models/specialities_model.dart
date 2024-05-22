class SpecilitiesModel {
  String serviceNameArb;
  String serviceNameEng;

  SpecilitiesModel({
    required this.serviceNameArb,
    required this.serviceNameEng,
  });

  factory SpecilitiesModel.fromJson(Map<String, dynamic> json) {
    return SpecilitiesModel(
      serviceNameEng: json['serviceNameEng'],
      serviceNameArb: json['serviceNameArb'],
    );
  }
}
