import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBarController extends GetxController {
  final PersistentTabController tabController = PersistentTabController(
    initialIndex: 0,
  );
}
