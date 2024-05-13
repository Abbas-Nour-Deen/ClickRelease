import 'package:flutter/material.dart';

class ProviderModel with ChangeNotifier {
  final String provID;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? sex;
  final String? idFront;
  final String? idBack;
  final String? passport;
  final String? residence;
  final String? sejilAdel;
  final String phoneNumber;
  final String? profileImage;
  final String? description;
  final String? providerUsername;
  final String? providerPass;
  final String? homeLocation;
  final int? onlineStatus;
  final String? entryUser;
  final DateTime entryDate;
  final String? updateUser;
  final DateTime updateDate;
  final int verified;
  final String? type;
  final String? instagram;
  final String? facebook;
  final String? linkedIn;
  final String? website;
  final String? education;
  final Map<String, dynamic>? location;
  final String? keyword;
  final int? indexs;

  ProviderModel({
    required this.provID,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.sex,
    required this.idFront,
    required this.idBack,
    required this.passport,
    required this.residence,
    required this.sejilAdel,
    required this.phoneNumber,
    this.profileImage,
    required this.description,
    required this.providerUsername,
    required this.providerPass,
    this.homeLocation,
    this.onlineStatus,
    required this.entryUser,
    required this.entryDate,
    this.updateUser,
    required this.updateDate,
    required this.verified,
    this.type,
    this.instagram,
    this.facebook,
    this.linkedIn,
    this.website,
    this.education,
    this.location,
    this.keyword,
    this.indexs,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      provID: json['provID'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'] ?? '',
      sex: json['Sex'] ?? '',
      idFront: json['idFront'] ?? '',
      idBack: json['idBack'] ?? '',
      passport: json['passport'] ?? '',
      residence: json['residence'] ?? '',
      sejilAdel: json['sejilAdel'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profileImage: json['profileImage'] ?? '',
      description: json['description'] ?? '',
      providerUsername: json['providerUsername'] ?? '',
      providerPass: json['providerPass'] ?? '',
      homeLocation: json['homeLocation'] ?? '',
      onlineStatus: json['onlineStatus'] ?? 1,
      entryUser: json['entryUser'] ?? '',
      entryDate: DateTime.parse(json['entryDate']) ?? DateTime.now(),
      updateUser: json['UpdateUser'] ?? '',
      updateDate: DateTime.parse(json['UpdateDate']) ?? DateTime.now(),
      verified: json['Verified'] ?? 1,
      type: json['Type'] ?? '',
      instagram: json['Instagram'] ?? '',
      facebook: json['FaceBook'] ?? '',
      linkedIn: json['LinkedIn'] ?? '',
      website: json['Website'] ?? '',
      education: json['Education'] ?? '',
      location: json['Location'] ?? '',
      keyword: json['Keyword'] ?? '',
      indexs: json['Indexs'] ?? 1,
    );
  }
}
