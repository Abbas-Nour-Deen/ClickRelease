import 'package:click_release/models/provider_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEngine {
  static final _instance = FirebaseAnalytics.instance;

  static void userSignedUp() {
    _instance.logSignUp(signUpMethod: "OTP");
  }

  static void likeProvider(ProviderModel provider) {
    _instance.logEvent(name: "LikeProvider", parameters: {
      "providername": "${provider.firstName},${provider.lastName}",
      "providerid": provider.provid,
    });
  }
}
