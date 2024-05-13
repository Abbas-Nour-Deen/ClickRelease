import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/categories_widget.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/customeSearch_bar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/imageslidShow.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/nearme_widget.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/recomenderForYou_widget.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/servicesChip_widget.dart';
import 'package:click_release/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen_widgets/custome_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final NavBarController _navController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                child: IgnorePointer(
                  child: CustomeSearchBar(
                    searchController: Get.find<SearchProviderController>(),
                  ),
                ),
              ),
              const ImageSlideShowWidget(),
              CategoriesWidget(),
              const RecommendedForYouSlideWidget(),
              const NearMeWidget(),
              ServicesChipsWidget()
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: Image.asset(
        'assets/images/clickLogo.png',
        fit: BoxFit.cover,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
      ),
    );
  }

  Widget header() {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) => Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  InkWell(
                    onTap: () => Utils().showLocationBottomSheet(),
                    child: Text(
                      controller.pickedLocation.locationName,
                      style: Get.textTheme.labelMedium,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ));
  }
}
