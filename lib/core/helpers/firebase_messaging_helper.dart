// ignore_for_file: sdk_version_since

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  final payload = message.data;
  await Firebase.initializeApp();
  if (kDebugMode) {
    log('>>> Background Payload : $payload');
    log('>>> Background Notification data : ${message.notification?.toMap()}');
  }
}

class FirebaseMessagingHelper {
  static final FirebaseMessagingHelper instance = FirebaseMessagingHelper._internal();
  factory FirebaseMessagingHelper() => instance;

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  RemoteMessage? _initialMessage;
  RemoteMessage? get initialMessage => _initialMessage;

  set setMessage(RemoteMessage? message) {
    _initialMessage = message;
  }

  late AndroidNotificationChannel channel;

  FirebaseMessagingHelper._internal() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  Future<void> initialize(Future<FirebaseApp> app) async {
    await app;
    final token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      log('Messaging token: $token');
    }
    channel = const AndroidNotificationChannel('com.impulses.islamic_app', 'Islamic App', importance: Importance.high);
    await Future.wait([
      getInitialMessage(),
      createNotificationChannel(channel),
      _configureNotifications(),
      _requestPermissions(),
    ]);
  }

  Future<RemoteMessage?> getInitialMessage() async => _initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  Future<void> _configureNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings("drawable/ic_stat_name");
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload == null) return;

        final data = json.decode(response.payload!);
        log(data.toString());
      },
    );
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final payload = jsonEncode(event.data);
      log('>>> Opened App Notification data : $payload');
    });
  }

  void _handleForegroundMessage(RemoteMessage message) async {
    final notificationTitle = message.notification?.title ?? 'Makanah';
    final notificationBody = message.notification?.body ?? '';
    final payload = jsonEncode(message.data);

    log('>>> Foreground Notification data : ${message.notification?.toMap()}');

    await _showNotification(title: notificationTitle, body: notificationBody, payload: payload);
  }

  Future<void> createNotificationChannel(AndroidNotificationChannel channel) async {
    return await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.name,
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<void> unsubscribeFromTopic(String topic) async => await FirebaseMessaging.instance.unsubscribeFromTopic(topic);

  Future<void> subscribeToTopic(String topic) async => await FirebaseMessaging.instance.subscribeToTopic(topic);
}
