import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:get/get.dart';

class LikedProvidersController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  LikedProvidersController({required this.dataRepo});

  final List<ProviderModel> likedProviders = [];

  final LoginController loginController = Get.find();

  Future<void> getLikedProviders() async {
    change(likedProviders, status: RxStatus.loading());
    try {
      final response = await dataRepo.getLikedProviders(
          userID: loginController.currentUserID);
      print("liked providers response ${response.body}");

      if (response.statusCode == 200) {
        likedProviders.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final ProviderModel provider =
              ProviderModel.fromJson(element as Map<String, dynamic>);

          likedProviders.add(provider);
        });

        if (likedProviders.isNotEmpty) {
          change(likedProviders, status: RxStatus.success());
        } else {
          change(likedProviders, status: RxStatus.empty());
        }
      } else {
        change(likedProviders, status: RxStatus.error());
      }
    } catch (e) {
      change(likedProviders, status: RxStatus.error());

      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLikedProviders();
  }
}
