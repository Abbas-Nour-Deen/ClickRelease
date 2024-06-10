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
    return await dataApiHandler.getProviders("api/providerByservice/$id");
  }

  Future<Response> getProviderBySearch({required String keyWord}) async {
    return await dataApiHandler
        .getCurrentProviderReviews("api/provider-search/$keyWord");
  }

  Future<Response> getCurrentProviderReviews({required String id}) async {
    return await dataApiHandler.getCurrentProviderReviews("api/reviews/$id");
  }

  Future<Response> getCurrentProviderProjects({required String id}) async {
    return await dataApiHandler
        .getCurrentProviderReviews("api/ProvProject/$id");
  }

  Future<Response> getCurrentProviderInfoData({required String id}) async {
    return await dataApiHandler
        .getCurrentProviderReviews("api/providerWSC/$id");
  }

  Future<Response> getTopProviders() async {
    return await dataApiHandler
        .getCurrentProviderReviews("api/providerByTop/top");
  }

  Future<Response> getZones() async {
    return await dataApiHandler.getAllServices("api/zone");
  }

  Future<Response> getDataByFilter(
      {serviceId, zoneId, rate, categoryID}) async {
    return await dataApiHandler.getdataByFilter(
        "api/provider/filter", serviceId, zoneId, rate, categoryID);
  }

  Future<Response> getLikedProviders({required userID}) async {
    return await dataApiHandler
        .getCurrentProviderReviews("api/favorite/$userID");
  }

  Future<Response> likeProvider(
      {required provID, required isFavorite, required clientID}) async {
    return await dataApiHandler.likeProvider(
        url: "api/favorite",
        provID: provID,
        isFvorite: isFavorite,
        clientID: clientID);
  }
}
