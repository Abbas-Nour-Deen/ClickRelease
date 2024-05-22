import 'package:click_release/models/certification_model.dart';
import 'package:click_release/models/specialities_model.dart';
import 'package:click_release/models/workingHours_model.dart';

class ProviderInfoModel {
  final List<WorkingHoursModel> workingHR;
  final List<SpecilitiesModel> speciality;
  final List<CertificationModel> certification;

  ProviderInfoModel({
    required this.workingHR,
    required this.speciality,
    required this.certification,
  });

  factory ProviderInfoModel.fromJson(Map<String, dynamic> json) {
    return ProviderInfoModel(
      workingHR: (json['workingHR'] as List<dynamic>)
          .map((e) => WorkingHoursModel.fromJson(e))
          .toList(),
      speciality: (json['speciality'] as List<dynamic>)
          .map((e) => SpecilitiesModel.fromJson(e))
          .toList(),
      certification: (json['certification'] as List<dynamic>)
          .map((e) => CertificationModel.fromJson(e))
          .toList(),
    );
  }
}
