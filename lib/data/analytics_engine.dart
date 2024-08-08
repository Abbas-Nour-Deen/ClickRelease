import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEngine {
  static final _instance = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: _instance);
  static void userSignedUp() {
    _instance.logSignUp(signUpMethod: "OTP");
  }

  static void likeProvider(ProviderModel provider) {
    _instance.logEvent(name: "Like_Provider", parameters: {
      "providername": "${provider.firstName},${provider.lastName}",
      "providerid": provider.provid.toString(),
    });
  }

  static void callProvider(ProviderModel provider) {
    _instance.logEvent(name: "Call_Provider", parameters: {
      "providername": "${provider.firstName},${provider.lastName}",
      "providerPhoneNumber": "${provider.phoneNumber}",
      "providerid": provider.provid,
    });
  }

  static void searchQuery(String query) {
    _instance
        .logEvent(name: "Search_Query", parameters: {"searchQueary": query});
  }

  static void filterQueary(
      {required String category,
      required String service,
      required String zone}) {
    _instance.logEvent(
        name: "Filter_Query",
        parameters: {"category": category, "service": service, "zone": zone});
  }

  static void viewProvider(ProviderModel provider) {
    _instance.logEvent(name: "View_Provider", parameters: {
      "providername": "${provider.firstName},${provider.lastName}",
      "providerid": provider.provid,
    });
  }

  static void viewCategory(CategoryModel category) {
    _instance.logEvent(name: "View_Category", parameters: {
      "categoryName": "${category.nameEn}",
    });
  }

  static void viewService(ServiceModel service) {
    _instance.logEvent(name: "View_Service", parameters: {
      "serviceName": "${service.nameEn}",
    });
  }
}
