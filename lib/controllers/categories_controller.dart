import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/category_model.dart';
import 'package:get/get.dart';

class CategoryControler extends GetxController with StateMixin {
  final DataRepo dataRepo;

  CategoryControler({required this.dataRepo});

  final List<CategoryModel> allCategories = [];

  bool isCategoriesLoaidng = false;

  final ProviderController providerController = Get.find();

  Future<void> getAllCategories() async {
    try {
      change(allCategories, status: RxStatus.loading());
      final response = await dataRepo.getAllCategories();
      if (response.statusCode == 200) {
        allCategories.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final CategoryModel category =
              CategoryModel.fromJson(element as Map<String, dynamic>);

          allCategories.add(category);
        });
        change(allCategories, status: RxStatus.success());

        print("cat length ${allCategories.length}");
      }
    } catch (e) {
      print(e.toString());
    }

    update(['categories']);
    providerController.update(["topProviders"]);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCategories();
  }
}
