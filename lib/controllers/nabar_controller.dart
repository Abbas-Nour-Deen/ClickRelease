import 'package:click_release/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBarController extends GetxController {
  final LocationController locationController =
      Get.put(LocationController(), permanent: true);

  final PersistentTabController tabController = PersistentTabController(
    initialIndex: 0,
  );
}
