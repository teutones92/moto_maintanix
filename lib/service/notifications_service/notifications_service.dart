import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moto_maintanix/models/app/code_status/code_status.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static late NotificationService nService;
  NotificationService();

  static Future<void> _onDidReceiveBackgroundNotification(
      NotificationResponse notifyResp) async {
    debugPrint('Notification Received in Background');
  }

  static Future<void> _onDidReceiveNotification(
      NotificationResponse notifyResp) async {
    debugPrint('Notification Received in Foreground');
  }

  Future<bool> getNotificationPermission() async {
    final permission = await Permission.notification.request();
    return permission.isGranted;
  }

  /// Represents the platform channel specifications for notifications.
  ///
  /// This class provides the details for creating a notification channel on Android.
  /// It includes the channel ID, channel name, importance level, and priority.
  //**class NotificationDetails**\\
  // ...
  final NotificationDetails _platformChanelSpecifications =
      const NotificationDetails(
    android: AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    ),
  );

  /// Initializes the notifications service.
  ///
  /// This method initializes the notifications service by calling the [_initialize] method and creating a new instance of the [NotificationService].
  /// It should be called before using any other methods or properties of the notifications service.
  ///
  /// Example usage:
  /// ```dart
  /// await NotificationsService.init();
  /// ```
  static init() async {
    await _initialize();
    nService = NotificationService();
  }

  /// Initializes the Flutter local notifications plugin.
  ///
  /// This method sets up the initialization settings for both Android and iOS platforms
  /// and initializes the [FlutterLocalNotificationsPlugin] with these settings.
  /// It also sets up the callback methods for handling notification responses.
  ///
  /// The Android initialization settings specify the default icon for notifications.
  /// The iOS initialization settings are currently empty but can be customized as needed.
  ///
  /// The [onDidReceiveBackgroundNotificationResponse] and [onDidReceiveNotificationResponse]
  /// callbacks are used to handle notifications received in the background and foreground, respectively.
  /// Example usage:
  /// ```dart
  /// await _initialize();
  /// ```
  static Future<void> _initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification_icon');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotification,
      onDidReceiveNotificationResponse: _onDidReceiveNotification,
    );
  }

  // This method is used to set a scheduled notification for a maintenance reminder.
  Future<CodeStatus> setScheduledNotification(MaintTable maintTable) async {
    var codeStatus =
        CodeStatus(code: Code.approved, name: CodeStatusEnum.approved);
    if (!await getNotificationPermission()) {
      return codeStatus =
          CodeStatus(code: Code.cancelled, name: CodeStatusEnum.cancelled);
    } else {
      final dateTimeParsed = DateTime.parse(maintTable.nextMaintDate);
      final date = TZDateTime.local(dateTimeParsed.year, dateTimeParsed.month,
          dateTimeParsed.day, 08, 00);
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        maintTable.id!,
        maintTable.maintType,
        maintTable.maintDescription,
        date,
        // TZDateTime.now(local).add(const Duration(seconds: 1)),
        _platformChanelSpecifications,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: maintTable.id.toString(),
        matchDateTimeComponents: DateTimeComponents.time,
      );
      return codeStatus;
    }
  }

  // This method is used to test the notification service by displaying a test notification.
  // Future<void> testNotification() async {
  //   if (!await getNotificationPermission()) return;
  //   await _flutterLocalNotificationsPlugin.show(
  //     0,
  //     'Test Notification',
  //     'This is a test notification',
  //     _platformChanelSpecifications,
  //   );
  // }

  // Cancels a scheduled notification.
  Future<void> cancelNotification(MaintTable maintTable) async {
    await _flutterLocalNotificationsPlugin.cancel(maintTable.id!);
  }
}
