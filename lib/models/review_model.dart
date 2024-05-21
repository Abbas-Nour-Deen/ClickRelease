class ReviewModel {
  String provID;
  String comment;
  int rate;
  String clientID;
  String firstName;
  String middleName;
  String lastName;
  String clientUsername;
  String profilePhoto;

  ReviewModel({
    required this.provID,
    required this.comment,
    required this.rate,
    required this.clientID,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.clientUsername,
    required this.profilePhoto,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      provID: json['provID'] ?? "",
      comment: json['comment'] ?? "",
      rate: json['rate'] ?? 0,
      clientID: json['clientID'] ?? "",
      firstName: json['FirstName'] ?? "",
      middleName: json['MiddleName'] ?? "",
      lastName: json['LastName'] ?? "",
      clientUsername: json['clientUsername'] ?? "",
      profilePhoto: json['profilePhoto'] ?? "",
    );
  }
}
