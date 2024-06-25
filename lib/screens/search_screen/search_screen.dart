import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/customeSearch_bar.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchProviderController _searchProviderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        type: false,
        title: S.of(context).search,
      ),
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
