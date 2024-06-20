import 'package:click_release/controllers/liked_providers_controller.dart';
import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/controllers/providerInfo_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_info.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:flutter/material.dart';
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

  final LoginController loginController = Get.find();

  final ProviderInfoController providerInfoController = Get.find();

  final LikedProvidersController likedProviderController = Get.find();

  final TextEditingController commentTextController = TextEditingController();

  int? rateOfProvider;

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
      final response = await dataRepo.getTopProviders(
          userID: loginController.currentUserID!);
      if (response.statusCode == 200) {
        topProviders.clear();

        final List<dynamic> list = response.body['providers'];

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          topProviders.add(provider);
        });

        // for (var provider in topProviders) {
        //   final ProviderInfoModel providerInfo = await providerInfoController
        //       .fetchData(providerID: provider.provid);
        //   provider.workingHR = providerInfo.workingHR;
        // }

        isTopProvidersLoading = false;

        print("top providers length ${topProviders.length}");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("top providers response ${e.toString()}");
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

  Future<void> likeProvider(
      {required ProviderModel provider, required bool isLiked}) async {
    try {
      final response = await dataRepo.likeProvider(
          provID: provider.provid,
          isFavorite: isLiked,
          clientID: loginController.currentUserID);

      if (response.statusCode == 200) {
        provider.isLiked = isLiked;
        if (!isLiked) {
          likedProviderController.likedProviders
              .removeWhere((element) => element.provid == provider.provid);

          likedProviderController.update();
        } else {
          likedProviderController.likedProviders.add(provider);
          likedProviderController.update();
        }
        update(['likebtn']);
      }
      print("like provider response ${response.statusCode}, ${response.body}");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> rateProvider() async {
    try {
      final response = await dataRepo.rateProvider(
          provID: selectedProvider.provid,
          comment: commentTextController.text,
          rate: rateOfProvider ?? 3,
          clientID: loginController.currentUserID,
          entryUser: loginController.currentUser.clientUsername,
          updateUser: loginController.currentUser.clientUsername);

      if (response.statusCode == 200) {
        print("provider rated successfully !");
      } else {
        print("failed to rate provider ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

// Widget getworkingTimeForProvider({provider}){

// }
}
