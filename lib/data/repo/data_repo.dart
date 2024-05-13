import 'package:click_release/data/api/data_api.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class DataRepo extends GetxService {
  final DataApiHandler dataApiHandler;

  DataRepo({required this.dataApiHandler});

  Future<Response> getAllCategories() async {
    return await dataApiHandler.getAllCategories("api/category");
  }

  Future<Response> getAllServices() async {
    return await dataApiHandler.getAllServices("api/service");
  }

  Future<Response> getServiceByID({required String id}) async {
    return await dataApiHandler.getAllServices("api/serviceByCat/$id");
  }

  Future<Response> getProviderByServiceID({required String id}) async {
    return await dataApiHandler.getAllServices("api/providerByservice/$id");
  }

  Future<Response> getProviderBySearch({required String keyWord}) async {
    return await dataApiHandler.getAllServices("api/provider-search/$keyWord");
  }
}
