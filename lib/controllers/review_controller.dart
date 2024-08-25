import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/project_model.dart';
import 'package:click_release/models/review_model.dart';
import 'package:get/get.dart';

class ReviewsAndProjectController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ReviewsAndProjectController({required this.dataRepo});

  final List<ReviewModel> currentProviderReviews = [];

  final ProviderController providerController = Get.find();

  late int totalFiveStars;
  late int totalFourStars;
  late int totalThreeStars;
  late int totalTwoStars;
  late int totalOneStars;
  late double average;

  // final ProjectsController projectsController =
  //     Get.put(ProjectsController(dataRepo: Get.find()));

  ProjectModel? currentProviderProjects;

  bool isDataLoading = false;

  Future<void> getData() async {
    isDataLoading = true;
    await getCurrentProviderReviews(
        providerID: providerController.selectedProvider.provid);
    await getProviderProjects(
        providerID: providerController.selectedProvider.provid);
    isDataLoading = false;
    update(['containedTab']);

    print("dataaaaaaaaaaa ${isDataLoading}");
  }

  Future<void> getCurrentProviderReviews({required String providerID}) async {
    try {
      final response = await dataRepo.getCurrentProviderReviews(id: providerID);
      if (response.statusCode == 200) {
        currentProviderReviews.clear();

        final List<dynamic> list = response.body['reviews'];

        list.forEach((element) {
          final ReviewModel review =
              ReviewModel.fromJson(element as Map<String, dynamic>);

          currentProviderReviews.add(review);
        });

        print("reviews length ${currentProviderReviews.length}");

        totalFiveStars =
            currentProviderReviews.where((element) => element.rate == 5).length;
        totalFourStars =
            currentProviderReviews.where((element) => element.rate == 4).length;
        totalThreeStars =
            currentProviderReviews.where((element) => element.rate == 3).length;
        totalTwoStars =
            currentProviderReviews.where((element) => element.rate == 2).length;
        totalOneStars =
            currentProviderReviews.where((element) => element.rate == 1).length;

        average = (5 * totalFiveStars +
                4 * totalFourStars +
                3 * totalThreeStars +
                2 * totalTwoStars +
                1 * totalOneStars) /
            currentProviderReviews.length;

        print("reviews length ${currentProviderReviews.length}");
      } else if (response.statusCode == 404) {
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getProviderProjects({required String providerID}) async {
    try {
      final response =
          await dataRepo.getCurrentProviderProjects(id: providerID);
      if (response.statusCode == 200) {
        final List<dynamic> list = response.body;

        if (list.isNotEmpty) {
          list.forEach((element) {
            final ProjectModel project =
                ProjectModel.fromJson(element as Map<String, dynamic>);
            currentProviderProjects = project;
          });
        }
      } else if (response.statusCode == 404) {
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
