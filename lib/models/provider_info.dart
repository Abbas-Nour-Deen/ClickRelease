import 'package:click_release/models/certification_model.dart';
import 'package:click_release/models/specialities_model.dart';

class ProviderInfoModel {
  final List<SpecilitiesModel> speciality;
  final List<CertificationModel> certification;

  ProviderInfoModel({
    required this.speciality,
    required this.certification,
  });

  factory ProviderInfoModel.fromJson(Map<String, dynamic> json) {
    return ProviderInfoModel(
      speciality: (json['speciality'] as List<dynamic>)
          .map((e) => SpecilitiesModel.fromJson(e))
          .toList(),
      certification: (json['certification'] as List<dynamic>)
          .map((e) => CertificationModel.fromJson(e))
          .toList(),
    );
  }
}
