import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/customeSearch_bar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return response();

    // _searchProviderController.searchTextController.text.isEmpty &&
    //         !_searchProviderController.isSearchLoading.value
    //     ? placeHolder()
    //     : response();
  }

  Widget response() {
    return _searchProviderController.obx(
        (state) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _searchProviderController.searchProviders.length,
              itemBuilder: (context, index) => SizedBox(
                  height: 120,
                  child: ProviderItem(
                      provider:
                          _searchProviderController.searchProviders[index],
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 3))),
            ),
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ));
  }

  Widget placeHolder() {
    return Column(
      children: [
        SvgPicture.asset("assets/images/empty_search.svg"),
        Text(
          "Find professionals you can rely on",
          style: Get.textTheme.titleMedium,
        ),
        Text(
          "Search by name or Keyword to find what you \nare looking for",
          textAlign: TextAlign.center,
          style: Get.textTheme.bodySmall!
              .copyWith(color: Colors.grey, fontSize: 11),
        )
      ],
    );
  }
}
