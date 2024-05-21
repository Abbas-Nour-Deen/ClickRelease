import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/project_model.dart';
import 'package:get/get.dart';

class ProjectsController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ProjectsController({required this.dataRepo});

  final List<ProjectModel> currentProviderProjects = [];

  Future<void> getProviderProjects({required String serviceID}) async {
    try {
      change(currentProviderProjects, status: RxStatus.loading());
      final response = await dataRepo.getCurrentProviderProjects(id: serviceID);
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
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProviderProjects(serviceID: "16456700-497b-4f03-83b4-2e2bc710f27b");
  }
}
