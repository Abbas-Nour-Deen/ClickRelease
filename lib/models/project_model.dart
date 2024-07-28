import 'package:get/get.dart';

class ProjectModel {
  final String provID;
  final String projectDesc;
  final DateTime entryDate;
  final List<String> imageUrl;
  ProjectModel(
      {required this.provID,
      required this.imageUrl,
      required this.projectDesc,
      required this.entryDate});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    List<String> combinedImageUrls = [];
    // Extract image URLs from the JSON
    String imageUrl = json['image'] ?? "";
    String image2Url = json['image2'] ?? "";
    String image3Url = json['image3'] ?? "";
    String image4Url = json['image4'] ?? "";

    combinedImageUrls.addIf(imageUrl.isNotEmpty, imageUrl);
    combinedImageUrls.addIf(image2Url.isNotEmpty, image2Url);
    combinedImageUrls.addIf(image3Url.isNotEmpty, image3Url);
    combinedImageUrls.addIf(image4Url.isNotEmpty, image4Url);

    // Combine image URLs into a single string or handle them as needed
    //  List <String>  combinedImageUrls = [
    //     imageUrl,
    //     image2Url,
    //     image3Url,
    //     image4Url
    //   ].where((url) => url.isNotEmpty).join(', ');

    return ProjectModel(
      imageUrl: combinedImageUrls,
      provID: json['provID'] ?? "",
      projectDesc: json['projectDesc'] ?? "",
      entryDate: DateTime.tryParse(json['EntryDate'] ?? '') ?? DateTime.now(),
    );
  }
}
