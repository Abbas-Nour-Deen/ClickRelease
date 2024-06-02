import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/controllers/zones_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProviderController extends GetxController
    with StateMixin<List<ProviderModel>> {
  final DataRepo dataRepo;

  SearchProviderController({required this.dataRepo});

  List<ProviderModel> searchProviders = [];
  RxBool isSearchLoading = false.obs;
  RxBool isFilterLoading = false.obs;

  TextEditingController searchTextController = TextEditingController();

  final CategoryControler categoryControler = Get.find();
  final AllServicesController servicesController = Get.find();

  final ZonesController zoneController = Get.find();

  final List<int> ratings = [1, 2, 3, 4, 5];

  CategoryModel? selectedCategoryForFilter;
  ServiceModel? selectedServiceForFilter;
  ZoneModel? selectedZoneForFilter;
  int? selectedRateForFilter;

  Future<void> getProvidersBySearch({required String keyWord}) async {
    try {
      isSearchLoading.value = true;
      change(searchProviders, status: RxStatus.loading());
      final response = await dataRepo.getProviderBySearch(keyWord: keyWord);
      if (response.statusCode == 200) {
        searchProviders.clear();

        final List<dynamic> list = response.body['providers'];

        if (list.isEmpty) {
          change(searchProviders, status: RxStatus.empty());
          return;
        }

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          searchProviders.add(provider);
        });
        change(searchProviders, status: RxStatus.success());

        print("providers length by search${searchProviders.length}");
      } else {
        change(searchProviders, status: RxStatus.error());
      }
      isSearchLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> onFilterSubmittied() async {
    try {
      isFilterLoading.value = true;
      change(searchProviders, status: RxStatus.loading());

      final response = await dataRepo.getDataByFilter(
          zoneId: selectedZoneForFilter!.zoneId,
          categoryID: selectedCategoryForFilter!.categoryID,
          rate: selectedRateForFilter,
          serviceId: selectedServiceForFilter!.serviceId);
      if (response.statusCode == 200) {
        searchProviders.clear();
        final List<dynamic> list = response.body['providers'];

        if (list.isEmpty) {
          change(searchProviders, status: RxStatus.empty());

          return;
        }

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          searchProviders.add(provider);
        });
        change(searchProviders, status: RxStatus.success());

        print("providers length by filter${searchProviders.length}");
      } else {
        change(searchProviders,
            status: RxStatus.error("Please try again later !"));

        print(response.statusText);
      }
      isFilterLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  void clearFiltrationData() {
    searchProviders.clear();

    selectedCategoryForFilter = null;
    selectedServiceForFilter = null;
    selectedZoneForFilter = null;
    selectedRateForFilter = null;
  }
}
