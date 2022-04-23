import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// TODO notification not setup properly
class MyNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var android = const AndroidInitializationSettings("mipmap/ic_launcher");
    var ios = const IOSInitializationSettings();
    var settings = InitializationSettings(android: android, iOS: ios);
    _notification.initialize(settings);
  }

  static Future showNotification({
    required int id,
    String? title,
    String? body,
    payload,
  }) async => _notification.show(id, title, body, await notificationDetails());


  static notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel_id",
        "channel_name",
        importance: Importance.max,
      ),
    );
  }

}
