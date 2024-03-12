import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
    update();
    print(currentIndex.value);
  }
}
