import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/categories_widget.dart';
import 'package:click_release/widgets/imageslidShow.dart';
import 'package:click_release/widgets/navbar_appbar.dart';
import 'package:click_release/widgets/recomenderForYou_widget.dart';
import 'package:click_release/widgets/searchShape.dart';
import 'package:click_release/widgets/servicesChip_widget.dart';
import 'package:click_release/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custome_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavBarController _navController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBarForNavBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              InkWell(
                onTap: () => _navController.tabController.jumpToTab(1),
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

  Widget header(context) {
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
                              S.of(context).LocationErrorpleasetryagain,
                              style: Get.textTheme.labelMedium,
                            ),
                        onLoading: Text(
                          S.of(context).searching,
                          style: Get.textTheme.labelMedium,
                        ),
                        (state) => SizedBox(
                              width: 300,
                              child: Text(
                                controller.pickedLocation.locationName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.labelMedium,
                              ),
                            )),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ));
  }
}
