import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/widgets/customeSearch_bar.dart';
import 'package:click_release/widgets/custome_drawer.dart';
import 'package:click_release/widgets/navbar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchProviderController _searchProviderController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarForNavBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeSearchBar(
                margin: const EdgeInsets.symmetric(vertical: 1),
              ),
              const SizedBox(
                height: 10,
              ),
              body()
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return GetBuilder<SearchProviderController>(
        builder: (controller) => _searchProviderController.resultContent);
  }
}
