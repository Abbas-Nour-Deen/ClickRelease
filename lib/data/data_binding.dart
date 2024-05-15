import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/controllers/onBoarding_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/controllers/service_byID_controller.dart';
import 'package:click_release/data/api/data_api.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataApiHandler());
    Get.lazyPut(() => DataRepo(dataApiHandler: Get.find()));
    Get.lazyPut(() => CategoryControler(dataRepo: Get.find()));
    Get.lazyPut(() => AllServicesController(dataRepo: Get.find()));
    Get.lazyPut(
        () => ProviderController(
              dataRepo: Get.find(),
            ),
        fenix: true);

    Get.lazyPut(() => ServiceByIDController(dataRepo: Get.find()));

    Get.lazyPut(() => SearchProviderController(dataRepo: Get.find()));
    Get.lazyPut(() => NavBarController());

    Get.lazyPut(() => OOnBoardingController());
  }
}
