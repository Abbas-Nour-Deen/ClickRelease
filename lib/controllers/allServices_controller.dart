import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/service_model.dart';
import 'package:get/get.dart';

class AllServicesController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  AllServicesController({required this.dataRepo});

  final List<ServiceModel> allServices = [];
  final List<ServiceModel> currentCategoryServices = [];

  late ServiceModel selectedService;

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
