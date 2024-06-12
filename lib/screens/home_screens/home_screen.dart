import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/categories_widget.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/imageslidShow.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/recomenderForYou_widget.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/searchShape.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/servicesChip_widget.dart';
import 'package:click_release/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen_widgets/custome_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavBarController _navController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              InkWell(
                onTap: () => _navController.tabController.index = 1,
                child: const IgnorePointer(
                  child: SearchShape(),
                ),
              ),
              const ImageSlideShowWidget(),
              CategoriesWidget(),
              RecommendedForYouSlideWidget(),
              // const NearMeWidget(),
              ServicesChipsWidget()
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: Image.asset('assets/images/clickLogo.png', height: 80),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
    );
  }

  Widget header() {
    return GetBuilder<LocationController>(
        builder: (controller) => Container(
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                  ),
                  InkWell(
                    onTap: () => Utils().showLocationBottomSheet(),
                    child: controller.obx(
                        onError: (error) => Text(
                              "Location Error, please try again!",
                              style: Get.textTheme.labelMedium,
                            ),
                        onLoading: Text(
                          "Searching",
                          style: Get.textTheme.labelMedium,
                        ),
                        (state) => Text(
                              controller.pickedLocation.locationName,
                              style: Get.textTheme.labelMedium,
                            )),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ));
  }
}
