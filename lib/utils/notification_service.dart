import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/calling/calling_screen.dart';
import 'package:flutter_learn/utils/app_utils.dart';
import 'package:flutter_learn/utils/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final _notificationService = NotificationService();
  await _notificationService.initialize();
  debugPrint('Handling a background message ${message.messageId}');
  _notificationService.showNotification(
      title: message.notification!.title!, body: message.notification!.body!);
}

class NotificationService {
  NotificationService();
  final FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeFirebaseMessaging() async {
    final _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingBackgroundHandler);

    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      debugPrint('Push Messaging token: $token');
    });
  }

  Future<void> initialize() async {
    /// Initialize the [FlutterLocalNotificationsPlugin] package.
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveLocalNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveLocalNotificationResponse,
    );

    /// Initialize the [FirebaseMessaging] package.
    await initializeFirebaseMessaging();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _flutterLocalNotificationsPlugin!
            .getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      AppUtils.initialRoute = CallLockScreen.routeName;
    }
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint(
        'onDidReceiveLocalNotification called. $id, $title, $body, $payload');
  }

  @pragma('vm:entry-point')
  static void _onDidReceiveLocalNotificationResponse(
      NotificationResponse details) {
    debugPrint(
        'onDidReceiveLocalNotificationResponse called. ${details.actionId}');
    BuildContext? context = AppUtils.navigatorKey.currentState?.context;

    switch (details.actionId) {
      case 'Accept':
        if (context != null) {
          // Navigator.pushNamed(context, Description.routeName,
          //     arguments: cardsList[0]);
        }
        break;
      case 'Reject':
        debugPrint('Reject');
        break;
      default:
        debugPrint('Default');
        break;
    }
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      Constants.notificationId,
      Constants.notificationChannel,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(Constants.notificationSound),
      fullScreenIntent: true,
      category: AndroidNotificationCategory('call'),
      actions: [
        AndroidNotificationAction(
          'Accept',
          'Accept',
          titleColor: Colors.green,
          showsUserInterface: true,
          cancelNotification: true,
        ),
        AndroidNotificationAction('Reject', 'Reject', titleColor: Colors.red),
      ],
    );

    const iosNotificationDetails =
        DarwinNotificationDetails(sound: Constants.notificationSound + '.wav');

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification(
      {required String title, required String body}) async {
    final notificationDetails = await _notificationDetails();
    await _flutterLocalNotificationsPlugin!.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> showScheduledNotification(
      {required String title,
      required String body,
      required DateTime scheduledDate}) async {
    final notificationDetails = await _notificationDetails();

    await _flutterLocalNotificationsPlugin!
        .zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    )
        .then((value) {
      // add a 30 second timer
      Future.delayed(const Duration(seconds: 20), () {
        _flutterLocalNotificationsPlugin!.cancel(0);
      });
    });
  }
}
