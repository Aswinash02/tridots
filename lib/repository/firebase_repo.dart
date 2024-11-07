import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:tridots/views/notification_screen.dart';

class FirebaseRepo {
  FirebaseMessaging firebaseInstance = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await requestPermission();
    await getToken();
    setupInteractedMessage();
  }

  Future<void> requestPermission() async {
    NotificationSettings settings = await firebaseInstance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted Permission');
    } else {
      print('User denied');
    }
  }

  Future<String> getToken() async {
    String? token = await firebaseInstance.getToken();
    print('token  $token');
    return token ?? '';
  }

  void setupInteractedMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
      initializeLocalNotifications(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(message);
    });

    RemoteMessage? initialMessage = await firebaseInstance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }
  }

  void initializeLocalNotifications(RemoteMessage message) {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        fullScreenIntent: true,
      );

      const NotificationDetails platformDetails =
          NotificationDetails(android: androidDetails);

      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformDetails,
        payload: message.data['payload'] ?? '',
      );
    }
  }

  void handleMessage(RemoteMessage message) {
    if (message.notification != null) {
      Get.to(NotificationScreen(
        title: message.notification!.title ?? '',
        message: message.notification!.body ?? '',
      ));
    }
  }
}
