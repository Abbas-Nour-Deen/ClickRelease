class ProviderModel {
  String provid;
  String firstName;
  String lastName;
  String phoneNumber;
  dynamic profileImage; // Can be of any type
  Location location;
  String description;
  String? facebook; // Can be of any type
  String? instagram; // Can be of any type
  String? indexs; // Can be of any type
  String? linkedIn; // Can be of any type
  String? website; // Can be of any type
  String sex;
  String sexDesc;
  String type;
  int verified;
  String locationCode;
  String? locationEnglishName;
  String? locationArabicName;
  int? rate;
  String serviceNameEng;
  String serviceNameArb;

  ProviderModel({
    required this.provid,
    required this.firstName,
    required this.lastName,
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
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      provid: json['provid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      location: Location.fromJson(json['Location']),
      description: json['description'],
      facebook: json['FaceBook'] ?? "",
      instagram: json['Instagram'] ?? "",
      indexs: json['Indexs'] ?? "",
      linkedIn: json['LinkedIn'] ?? "",
      website: json['website'] ?? "",
      sex: json['Sex'],
      sexDesc: json['sexDesc'],
      type: json['Type'],
      verified: json['Verified'],
      locationCode: json['LocationCode'],
      locationEnglishName: json['locationEnglishName'] ?? "",
      locationArabicName: json['locationArabicName'] ?? "",
      rate: json['rate'] ?? 0,
      serviceNameEng: json['serviceNameEng'],
      serviceNameArb: json['serviceNameArb'],
    );
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
