import 'package:click_release/models/workingHours_model.dart';

class ProviderModel {
  String provid;
  String firstName;
  String lastName;
  String phoneNumber;
  String providerUsername;
  dynamic profileImage; // Can be of any type
  Location location;
  String description;
  String? facebook; // Can be of any type
  String? instagram; // Can be of any type
  int? indexs; // Can be of any type
  String? linkedIn; // Can be of any type
  String? website; // Can be of any type
  String sex;
  String sexDesc;
  String type;
  String education; //missing
  int verified;
  String locationCode;
  String? locationEnglishName;
  String? locationArabicName;
  double? rate;
  String serviceNameEng;
  String serviceNameArb;
  String categoryNameArb;
  String categoryNameEng;
  String categoryIcon;
  List<WorkingHoursModel>? workingHR;

  ProviderModel({
    required this.provid,
    required this.education,
    required this.firstName,
    required this.lastName,
    required this.providerUsername,
    required this.phoneNumber,
    this.profileImage,
    required this.location,
    required this.description,
    this.facebook,
    this.instagram,
    this.indexs,
    this.linkedIn,
    this.website,
    required this.sex,
    required this.sexDesc,
    required this.type,
    required this.verified,
    required this.locationCode,
    this.locationEnglishName,
    this.locationArabicName,
    this.rate,
    required this.serviceNameEng,
    required this.serviceNameArb,
    required this.categoryNameEng,
    required this.categoryNameArb,
    required this.categoryIcon,
    this.workingHR,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
        education: json['Education'] ?? '',
        provid: json['provID'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        providerUsername: json['providerUsername'] ?? '',
        phoneNumber: json['phoneNumber'] ?? "",
        profileImage: json['profileImage'] ?? "",
        location: Location.fromJson(json['Location']),
        description: json['description'] ?? '',
        facebook: json['FaceBook'] ?? "",
        instagram: json['Instagram'] ?? "",
        indexs: json['Indexs'] ?? "",
        linkedIn: json['LinkedIn'] ?? "",
        website: json['website'] ?? "",
        sex: json['Sex'] ?? "",
        sexDesc: json['sexDesc'] ?? "",
        type: json['Type'] ?? "",
        verified: json['Verified'] ?? "",
        locationCode: json['LocationCode'] ?? "",
        locationEnglishName: json['locationEnglishName'] ?? "",
        locationArabicName: json['locationArabicName'] ?? "",
        rate: double.parse(json['averageRate'].toString()) ?? 0.0,
        serviceNameEng:
            json['categories'][0]['services'][0]['serviceNameEng'] ?? '',
        serviceNameArb:
            json['categories'][0]['services'][0]['serviceNameArb'] ?? '',
        categoryNameEng: json['categories'][0]['categoryNameEng'] ?? '',
        categoryNameArb: json['categories'][0]['categoryNameArb'] ?? '',
        categoryIcon: json['categories'][0]['icon']);
  }
}

class Location {
  double x;
  double y;

  Location({required this.x, required this.y});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      x: json['x'].toDouble(),
      y: json['y'].toDouble(),
    );
  }
}
