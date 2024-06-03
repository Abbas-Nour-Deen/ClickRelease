class UserModel {
  String firstName;
  String middleName;
  String lastName;
  String sex;
  String sexDesc;
  String profilePhoto;
  String clientPhone;
  dynamic location;

  UserModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.sex,
    required this.sexDesc,
    required this.profilePhoto,
    required this.clientPhone,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['FirstName'] ?? "",
      middleName: json['MiddleName'] ?? "",
      lastName: json['LastName'] ?? "",
      sex: json['Sex'] ?? "",
      sexDesc: json['SexDesc'] ?? "",
      profilePhoto: json['profilePhoto'] ?? "",
      clientPhone: json['clientPhone'] ?? "",
      location: json['Location'],
    );
  }
}
