import 'package:click_release/controllers/project_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/review_model.dart';
import 'package:get/get.dart';

class ReviewsController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ReviewsController({required this.dataRepo});

  final List<ReviewModel> currentProviderReviews = [];

  final ProviderController providerController = Get.find();

  late int totalFiveStars;
  late int totalFourStars;
  late int totalThreeStars;
  late int totalTwoStars;
  late int totalOneStars;
  late double average;

  final ProjectsController projectsController =
      Get.put(ProjectsController(dataRepo: Get.find()));

  Future<void> getCurrentProviderReviews({required String providerID}) async {
    try {
      print("getting reviews");

      change(currentProviderReviews, status: RxStatus.loading());
      final response = await dataRepo.getCurrentProviderReviews(id: providerID);
      if (response.statusCode == 200) {
        currentProviderReviews.clear();

        final List<dynamic> list = response.body['reviews'];

        list.forEach((element) {
          final ReviewModel review =
              ReviewModel.fromJson(element as Map<String, dynamic>);

          currentProviderReviews.add(review);
        });

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

        change(currentProviderReviews, status: RxStatus.success());

        print("reviews length ${currentProviderReviews.length}");
      } else if (response.statusCode == 404) {
        change(currentProviderReviews, status: RxStatus.empty());
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentProviderReviews(
        providerID: "16456700-497b-4f03-83b4-2e2bc710f27b");
  }
}
