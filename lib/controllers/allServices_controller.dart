import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  AllServicesController({required this.dataRepo});

  final List<ServiceModel> allServices = [];
  List<ServiceModel> filteredServices = [];

  late ServiceModel selectedService;

  final LocalizationController localizationController = Get.find();
  TextEditingController serviceSearchController = TextEditingController();

  void searchLogic(String query) {
    String lowercaseQuery = query.toLowerCase();
    filteredServices.clear();
    filteredServices = allServices.where((service) {
      return service.nameEn.toLowerCase().contains(lowercaseQuery) ||
          service.descr.toLowerCase().contains(lowercaseQuery) ||
          service.nameAr.contains(lowercaseQuery);
    }).toList();

    update(['servicesList']);
  }

  Future<void> getAllallServices() async {
    try {
      change(allServices, status: RxStatus.loading());
      final response = await dataRepo.getAllServices();
      if (response.statusCode == 200) {
        allServices.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final ServiceModel service =
              ServiceModel.fromJson(element as Map<String, dynamic>);

          allServices.add(service);
        });
        selectedService = allServices.first;
        change(allServices, status: RxStatus.success());

        print("allServices length ${allServices.length}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllallServices();
  }
}
