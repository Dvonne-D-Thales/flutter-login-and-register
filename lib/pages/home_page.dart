import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:latihan_11pplg1/controllers/notification_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController c = Get.put(NotificationController());

    // Listener diletakkan di sini agar hanya aktif saat halaman ini dibuka
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Foreground message: ${message.notification?.title}");
      final title = message.notification?.title ?? "Notifikasi";
      final body = message.notification?.body ?? "";
      c.lastMessage.value = "$title\n$body";
      c.showTopNotification(context, title, body);
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Cloud Messaging")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("📩 Last message received:"),
              const SizedBox(height: 10),
              Text(
                c.lastMessage.value,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                "📱 Your FCM Token:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SelectableText(
                c.token.value,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
