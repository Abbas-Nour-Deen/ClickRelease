import 'package:click_release/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBarController extends GetxController {
  final LocationController locationController =
      Get.put(LocationController(), permanent: true);

  PersistentTabController tabController = PersistentTabController(
    initialIndex: 0,
  );
}
