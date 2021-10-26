import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as timezone;

class NotificationLogic extends ChangeNotifier {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotificationPlugin() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('ic_launcher');
    final IOSInitializationSettings iosSettings = IOSInitializationSettings();
    final initSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await notificationsPlugin.initialize(initSettings);
  }

  void showNotification(
      String title, String body, DateTime dateTime, int id) async {
    var androidDetails = AndroidNotificationDetails(
        'notificationChannel', 'channel', 'description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        showWhen: false,
        enableVibration: true);
    var iosDetails = IOSNotificationDetails();
    var details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        timezone.TZDateTime.from(
            dateTime, timezone.getLocation('Europe/Moscow')),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    print(id);
  }

  void cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  void cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }
}
