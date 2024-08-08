import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/default_model.dart';
import 'package:get/get.dart';

class DefaultsController extends GetxController {
  final DataRepo dataRepo;

  DefaultsController({required this.dataRepo});

  final List<DefaultModel> defaultsList = [];

  Future<void> getDefaults() async {
    try {
      final response = await dataRepo.getDefaults();

      if (response.statusCode == 200) {
        final List data = response.body;

        data.forEach(
          (element) {
            final DefaultModel model = DefaultModel.fromJson(element);

            defaultsList.add(model);
          },
        );

        print("defaults length ${defaultsList.length}");
      }
    } catch (e) {}
  }

  @override
  void onInit() {
    super.onInit();
    getDefaults();
  }
}
