import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:get/get.dart';

class SearchProviderController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  SearchProviderController({required this.dataRepo});

  List<ProviderModel> searchProviders = [];

  Future<void> getProvidersBySearch({required String keyWord}) async {
    try {
      change(searchProviders, status: RxStatus.loading());
      final response = await dataRepo.getProviderBySearch(keyWord: keyWord);
      if (response.statusCode == 200) {
        searchProviders.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          searchProviders.add(provider);
        });
        change(searchProviders, status: RxStatus.success());

        print("providers length by search${searchProviders.length}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getProvidersByFiltration(
      {required String serviceID,
      required String zoneID,
      required int rate}) async {
    try {
      // change(searchProviders, status: RxStatus.loading());
      // final response = await dataRepo.getProviderBySearch(keyWord: keyWord);
      // if (response.statusCode == 200) {
      //   searchProviders.clear();

      //   final List<dynamic> list = response.body;

      //   list.forEach((element) {
      //     final ProviderModel provider =
      //         ProviderModel.fromJson(element as Map<String, dynamic>);

      //     searchProviders.add(provider);
      //   });
      //   change(searchProviders, status: RxStatus.success());

      //   print("providers length by search${searchProviders.length}");
      // }
    } catch (e) {
      print(e.toString());
    }
  }
}
