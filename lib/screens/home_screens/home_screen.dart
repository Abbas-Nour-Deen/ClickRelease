import 'package:click_release/widgets/homescreen_widgets/categories_widget.dart';
import 'package:click_release/widgets/homescreen_widgets/customeSearch_bar.dart';
import 'package:click_release/widgets/homescreen_widgets/imageslidShow.dart';
import 'package:click_release/widgets/homescreen_widgets/recomenderForYou_widget.dart';
import 'package:click_release/widgets/homescreen_widgets/servicesChip_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(),
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const CustomeSearchBar(),
              const ImageSlideShowWidget(),
              CategoriesWidget(),
              RecommendedForYouSlideWidget(),
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

  Drawer drawer() {
    return Drawer();
  }

  Widget header() {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
          ),
          Text(
            "Beirut, Lebanon",
            style: Get.textTheme.labelMedium,
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
