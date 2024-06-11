class UserModel {
  String userID;
  String firstName;
  String middleName;
  String lastName;
  String clientUsername;
  String sex;
  String sexDesc;
  String profilePhoto;
  String clientPhone;
  dynamic location;

  UserModel(
      {required this.userID,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.sex,
      required this.sexDesc,
      required this.profilePhoto,
      required this.clientPhone,
      required this.location,
      required this.clientUsername});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      clientUsername: json['Username'],
      userID: json['clientId'],
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
