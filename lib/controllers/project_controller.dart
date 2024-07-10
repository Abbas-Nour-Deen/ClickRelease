import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/project_model.dart';
import 'package:get/get.dart';

class ProjectsController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ProjectsController({required this.dataRepo});

  final List<ProjectModel> currentProviderProjects = [];

  final ProviderController providerController = Get.find();

  Future<void> getProviderProjects({required String providerID}) async {
    try {
      change(currentProviderProjects, status: RxStatus.loading());
      final response =
          await dataRepo.getCurrentProviderProjects(id: providerID);
      if (response.statusCode == 200) {
        currentProviderProjects.clear();

        final List<dynamic> list = response.body;

        list.forEach((element) {
          final ProjectModel project =
              ProjectModel.fromJson(element as Map<String, dynamic>);

          currentProviderProjects.add(project);
        });
        change(currentProviderProjects, status: RxStatus.success());

        print("providers projects length ${currentProviderProjects.length}");
      } else if (response.statusCode == 404) {
        change(currentProviderProjects, status: RxStatus.empty());
      } else {
        print(response.statusCode);
      }
      update(['containedTab']);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProviderProjects(providerID: providerController.selectedProvider.provid);
  }
}
