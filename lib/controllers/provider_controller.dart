import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderController extends GetxController
    with StateMixin<List<ProviderModel>> {
  final DataRepo dataRepo;

  ProviderController({required this.dataRepo});

  final List<ProviderModel> currentProviders = [];
  final List<ProviderModel> topProviders = [];

  late ProviderModel selectedProvider;

  bool isTopProvidersLoading = false;
  bool isFirstLoading = true;
  Future<void> getProviderByServiceID({required String serviceID}) async {
    try {
      change(currentProviders, status: RxStatus.loading());
      final response = await dataRepo.getProviderByServiceID(id: serviceID);
      if (response.statusCode == 200) {
        currentProviders.clear();

        final List<dynamic> list = response.body['providers'];

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          currentProviders.add(provider);
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

  Future<void> getTopProviders() async {
    try {
      isTopProvidersLoading = true;
      isFirstLoading = false;
      final response = await dataRepo.getTopProviders();
      if (response.statusCode == 200) {
        topProviders.clear();

        final List<dynamic> list = response.body['providers'];

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          topProviders.add(provider);
        });
        isTopProvidersLoading = false;

        print("top providers length ${topProviders.length}");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }

    update(['topProviders']);
  }

  void launchUrls(
      {required String url, required bool inApp, required String type}) async {
    try {
      final Uri faceBookUri = Uri.parse("https://www.facebook.com/$url");
      final Uri instagramUri = Uri.parse("https://www.instagram.com/$url");
      final Uri linkedInUri = Uri.parse("https://www.linkedin.com/in/$url");
      final Uri websiteUri = Uri.parse(url);
      final Uri callUri = Uri.parse('tel:$url');

      switch (type) {
        case "linkedin":
          if (await canLaunchUrl(linkedInUri)) {
            await launchUrl(linkedInUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }

        case "facebook":
          if (await canLaunchUrl(faceBookUri)) {
            await launchUrl(faceBookUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
        case "instagram":
          if (await canLaunchUrl(instagramUri)) {
            await launchUrl(instagramUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
        case "website":
          if (await canLaunchUrl(websiteUri)) {
            await launchUrl(websiteUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
        case "call":
          if (await canLaunchUrl(callUri)) {
            await launchUrl(callUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
