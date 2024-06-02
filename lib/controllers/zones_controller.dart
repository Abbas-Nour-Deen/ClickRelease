import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:get/get.dart';

class ZonesController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  ZonesController({required this.dataRepo});

  final List<ZoneModel> zones = [];

  Future<void> getZones() async {
    change(zones, status: RxStatus.loading());
    zones.clear();
    final response = await dataRepo.getZones();
    if (response.statusCode == 200) {
      final List<dynamic> list = response.body;

      list.forEach((element) {
        final ZoneModel zone =
            ZoneModel.fromJson(element as Map<String, dynamic>);

        zones.add(zone);
      });

      if (zones.isNotEmpty) {
        change(zones, status: RxStatus.success());
      } else {
        change(zones, status: RxStatus.empty());
      }

      print("zonesLength${zones.length}");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getZones();
  }
}
