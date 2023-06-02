import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    final token = await messaging.getToken();
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    messaging.subscribeToTopic('chat');

    print(token);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('usergranted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('usergranted provisional permission');
    } else {
      print('user denied permission');
    }
  }
}
