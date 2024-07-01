import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/controllers/zones_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:get/get.dart';

class FiltrationController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  FiltrationController({required this.dataRepo});

  RxBool isFilterLoading = false.obs;
  final CategoryControler categoryControler = Get.find();
  final AllServicesController servicesController = Get.find();

  List<ProviderModel> filterProviders = [];

  final ZonesController zoneController = Get.find();

  final List<int> ratings = [1, 2, 3, 4, 5];

  CategoryModel? selectedCategoryForFilter;
  ServiceModel? selectedServiceForFilter;
  ZoneModel? selectedZoneForFilter;
  int? selectedRateForFilter;

  final LocalizationController localizationController = Get.find();

  Future<void> onFilterSubmittied() async {
    try {
      isFilterLoading.value = true;
      change(filterProviders, status: RxStatus.loading());

      final response = await dataRepo.getDataByFilter(
          zoneId: selectedZoneForFilter!.zoneId,
          categoryID: selectedCategoryForFilter!.categoryID,
          rate: selectedRateForFilter,
          serviceId: selectedServiceForFilter!.serviceId);
      if (response.statusCode == 200) {
        filterProviders.clear();
        final List<dynamic> list = response.body['providers'];

        if (list.isEmpty) {
          change(filterProviders, status: RxStatus.empty());

          return;
        }

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          filterProviders.add(provider);
        });
        if (filterProviders.isEmpty) {
          change(filterProviders, status: RxStatus.empty());
        } else {
          change(filterProviders, status: RxStatus.success());
        }

        print("providers length by filter${filterProviders.length}");
      } else {
        change(filterProviders, status: RxStatus.empty());

        print(response.statusText);
      }

      // scrolController.animateTo(scrolController.position.maxScrollExtent,
      //     duration: const Duration(milliseconds: 300), curve: Curves.linear);
    } catch (e) {
      print(e.toString());
    }
  }

  void clearFiltrationData() {
    selectedCategoryForFilter = null;
    selectedServiceForFilter = null;
    selectedZoneForFilter = null;
    selectedRateForFilter = null;
  }
}
