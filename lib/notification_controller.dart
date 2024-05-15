import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController{
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification) async {}

   @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayMethod(
    ReceivedNotification receivedNotification) async {}

   @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction) async {}
  
  //notification action bar, can be used to redirect user to different page
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction) async {}
}