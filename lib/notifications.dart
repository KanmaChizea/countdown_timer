import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createNotification(String? eventName, String totalTime) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'notification',
          title: 'TImer done',
          body: eventName == '' ? totalTime : '$eventName in $totalTime'));
}

Future<void> notificationPermission() async {
  await AwesomeNotifications().isNotificationAllowed().then((value) {
    if (value == false) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
