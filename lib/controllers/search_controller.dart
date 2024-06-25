import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchProviderController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  SearchProviderController({required this.dataRepo});

  List<ProviderModel> searchProviders = [];
  RxBool isSearchLoading = false.obs;

  TextEditingController searchTextController = TextEditingController();

  late Widget resultContent;

  Future<void> getProvidersBySearch({required String keyWord}) async {
    try {
      resultContent = loadingPlaceHolder();
      update();
      // change(searchProviders, status: RxStatus.loading());
      final response = await dataRepo.getProviderBySearch(keyWord: keyWord);
      if (response.statusCode == 200) {
        searchProviders.clear();

        final List<dynamic> list = response.body['providers'];

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          searchProviders.add(provider);
        });

        if (searchProviders.isEmpty) {
          resultContent = emptyResultPlaceHolder();
        } else {
          resultContent = responseResult();
        }
        print("providers length by search${searchProviders.length}");
      } else {
        resultContent = emptyResultPlaceHolder();
      }
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Widget responseResult() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchProviders.length,
      itemBuilder: (context, index) => SizedBox(
          height: 120,
          child: ProviderItem(
              provider: searchProviders[index],
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3))),
    );
  }

  Widget initialPlaceHolder() {
    return Column(
      children: [
        SvgPicture.asset("assets/images/empty_search.svg"),
        Text(
          S.of(Get.context!).Findprofessionalsyoucanrelyon,
          style: Get.textTheme.titleMedium,
        ),
        Text(
          S.of(Get.context!).SearchbynameorKeywordtofindwhatyouarelookingfor,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodySmall!
              .copyWith(color: Colors.grey, fontSize: 11),
        )
      ],
    );
  }

  Widget emptyResultPlaceHolder() {
    return Column(
      children: [
        SizedBox(
            height: 300, child: SvgPicture.asset("assets/search_empty.svg")),
        Text(
          S.of(Get.context!).Wecouldntfindanymatchesforyoursearch,
          style: Get.textTheme.titleMedium,
        ),
        Text(
          S.of(Get.context!).Trydifferentkeywords,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodySmall!
              .copyWith(color: Colors.grey, fontSize: 11),
        )
      ],
    );
  }

  Widget loadingPlaceHolder() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    resultContent = initialPlaceHolder();
    update();
  }
}
