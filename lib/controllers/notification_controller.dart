import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  RxString token = ''.obs;
  RxString lastMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initNotification();
  }

  Future<void> _initNotification() async {
    await messaging.requestPermission();

    token.value = await messaging.getToken() ?? 'No token';
    print("🔑 FCM Token: ${token.value}");

    // Setup notifikasi lokal
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showTopNotification(BuildContext context, String title, String body) {
    Flushbar(
      title: title,
      message: body,
      duration: const Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.blueAccent,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      icon: const Icon(Icons.notifications, color: Colors.white),
    ).show(context);
  }
}
