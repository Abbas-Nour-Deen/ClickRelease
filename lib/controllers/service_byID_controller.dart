import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/service_model.dart';
import 'package:get/get.dart';

class ServiceByIDController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ServiceByIDController({required this.dataRepo});

  final List<ServiceModel> currentCategoryServices = [];

  Future<void> getServiceByID({required String categoryID}) async {
    try {
      change(currentCategoryServices, status: RxStatus.loading());
      final response = await dataRepo.getServiceByID(id: categoryID);
      if (response.statusCode == 200) {
        currentCategoryServices.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final ServiceModel service =
              ServiceModel.fromJson(element as Map<String, dynamic>);

          currentCategoryServices.add(service);
        });
        change(currentCategoryServices, status: RxStatus.success());

        print("current services length ${currentCategoryServices.length}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
