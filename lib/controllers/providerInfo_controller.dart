import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/provider_info.dart';
import 'package:get/get.dart';

class ProviderInfoController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ProviderInfoController({required this.dataRepo});

  late ProviderInfoModel currentProviderInfoModel;

  final ProviderController providerController = Get.find();

  Future<void> fetchData({required String providerID}) async {
    change(null, status: RxStatus.loading());

    final response = await dataRepo.getCurrentProviderInfoData(id: providerID);
    if (response.statusCode == 200) {
      currentProviderInfoModel = ProviderInfoModel.fromJson(response.body);
      change(currentProviderInfoModel, status: RxStatus.success());

      print(currentProviderInfoModel);
    } else {
      change(null, status: RxStatus.error());

      throw Exception('Failed to load data');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData(providerID: providerController.selectedProvider.provid);
  }
}
