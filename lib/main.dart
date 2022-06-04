import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:countdown_timer/countdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize('resource://mipmap/ic_launcher', [
    NotificationChannel(
        channelKey: 'notification',
        channelName: 'Alarm Notification',
        channelDescription: 'Notify on end of countdown timer',
        importance: NotificationImportance.High),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomepage(),
    );
  }
}
