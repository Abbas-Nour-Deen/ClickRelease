import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Future<void> initializeNotification() async {
    // final fcm = FirebaseMessaging.instance;

    // await fcm.requestPermission(provisional: true);

    // if (TargetPlatform.iOS == true) {
    //   final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    //   if (apnsToken != null) {}
    // }

    // final token = await fcm.getToken();

    // fcm.subscribeToTopic("event");

    // print("notf token updated ${token}");

    // FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    //   print("notf token updated ${fcmToken}");
    // }).onError((err) {
    //   print("error updating notif");
    // });
  }
}
