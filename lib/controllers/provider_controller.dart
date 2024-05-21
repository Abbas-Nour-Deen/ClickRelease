import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ProviderController({required this.dataRepo});

  final List<ProviderModel> currentProviders = [];

  late ProviderModel selectedProvider;

  Future<void> getProviderByServiceID({required String serviceID}) async {
    try {
      change(currentProviders, status: RxStatus.loading());
      final response = await dataRepo.getProviderByServiceID(id: serviceID);
      if (response.statusCode == 200) {
        currentProviders.clear();

        final List<dynamic> list = response.body['providers'];

        list.forEach((element) {
          final ProviderModel service =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          currentProviders.add(service);
        });
        change(currentProviders, status: RxStatus.success());

        print("providers length ${currentProviders.length}");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void launchUrls({required Uri url, required bool inApp}) async {
    try {
      if (await canLaunchUrl(url)) {
        if (inApp) {
          await launchUrl(url, mode: LaunchMode.inAppWebView);
        } else {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {}
  }
}
