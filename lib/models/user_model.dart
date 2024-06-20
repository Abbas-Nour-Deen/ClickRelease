class UserModel {
  String userID;
  String firstName;
  String lastName;
  String clientUsername;
  String sex;
  String sexDesc;
  String? profilePhoto;
  String clientPhone;

  UserModel(
      {required this.userID,
      required this.firstName,
      required this.lastName,
      required this.sex,
      required this.sexDesc,
      this.profilePhoto,
      required this.clientPhone,
      required this.clientUsername});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      clientUsername: json['Username'],
      userID: json['clientId'],
      firstName: json['FirstName'] ?? "",
      lastName: json['LastName'] ?? "",
      sex: json['Sex'] ?? "",
      sexDesc: json['SexDesc'] ?? "",
      profilePhoto: json['profilePhoto'] ?? "",
      clientPhone: json['clientPhone'] ?? "",
    );
  }
}
