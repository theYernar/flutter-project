// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:project/src/feature/app/router/app_router.dart';
// import 'package:project/src/feature/auth/database/auth_dao.dart';
// import 'package:project/src/feature/home/model/notification_dto.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// const _tag = 'NotificationService';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description: 'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// class NotificationService {
//   NotificationService._();
//   static final NotificationService instance = NotificationService._();

//   late FirebaseMessaging _messaging;

//   Future<void> saveDeviceToken({
//     required IAuthDao authDao,
//   }) async {
//     try {
//       final deviceToken = await getDeviceToken(authDao: authDao);
//       if (deviceToken != null) {
//         await authDao.deviceToken.setValue(deviceToken);
//       }
//       log('$deviceToken', name: _tag);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> init() async {
//     _messaging = FirebaseMessaging.instance;

//     final settings = await _messaging.requestPermission();

//     log('Permission status: ${settings.authorizationStatus}', name: _tag);

//     await _messaging.setForegroundNotificationPresentationOptions();

//     if (Platform.isAndroid) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//       log(' Notification channel created', name: _tag);
//     }

//     const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initializationSettingsIOs = DarwinInitializationSettings();
//     const initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOs,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       settings: initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         log('Notification tapped: ${response.payload}', name: _tag);
//       },
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('📩 Message received while app is in FOREGROUND', name: _tag);
//       log('Title: ${message.notification?.title}', name: _tag);
//       log('Body: ${message.notification?.body}', name: _tag);
//       log('id: ${message.threadId}', name: _tag);

//       final notification = message.notification;

//       if (Platform.isIOS) {
//         return;
//       }
//       if (notification != null) {
//         flutterLocalNotificationsPlugin.show(
//           id: notification.hashCode,
//           title: notification.title,
//           body: notification.body,
//           notificationDetails: NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               importance: Importance.high,
//               priority: Priority.high,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ),
//           payload: jsonEncode(message.data),
//         );

//         log(' Notification displayed', name: _tag);
//       }
//     });

//     log(' NotificationService initialized', name: _tag);
//   }

//   Future<void> onMessageOpenedApp(BuildContext context) async {
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         if (!context.mounted) return;
//         _handleOnTap(message, context);
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       if (!context.mounted) return;
//       _handleOnTap(event, context);
//     });
//   }

//   /// Handle firebase notification tap
//   void _handleOnTap(RemoteMessage event, BuildContext context) {
//     log('"ONTAP:::" data --- ${event.data}', name: _tag);
//     log('"ONTAP:" data --- ${event.data}', name: _tag);

//     try {
//       final data = NotificationItemDTO.fromJson(event.data);
//       log('Title ${data.title}', name: 'feedback id from push');
//       log('ID ${data.id}', name: 'feedback id from push');
//       log('Data $data', name: 'feedback id from push');
//       context.router.push(
//         const NotificationRoute(),
//       );
//     } catch (e, stackTrace) {
//       log('Error navigating to detail screen: $e\n$stackTrace', name: _tag);
//     }
//   }

//   Future<String?> getDeviceToken({
//     required IAuthDao authDao,
//   }) async {
//     if (Platform.isIOS) {
//       String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//       if (apnsToken == null) {
//         log('APNs token not available, retrying after 5 seconds');
//         await Future<void>.delayed(const Duration(seconds: 5));
//         apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         if (apnsToken == null) {
//           log('Failed to retrieve APNs token after retry');
//           return null; // Exit if APNs token is still null
//         }
//       }
//       log('APNs token: $apnsToken');
//     }

//     // Get FCM token
//     final String? deviceToken = await FirebaseMessaging.instance.getToken();
//     if (deviceToken == null) {
//       log('Failed to retrieve FCM token');
//       return null;
//     }

//     try {
//       await authDao.deviceToken.setValue(deviceToken);
//       log('Device token stored successfully: $deviceToken');
//     } catch (e) {
//       log('Failed to store device token: $e');
//     }

//     return deviceToken;
//   }

//   Future<void> subscribeToTopic({
//     required String topic,
//   }) async {
//     try {
//       await FirebaseMessaging.instance.subscribeToTopic('push_$topic');
//     } catch (e) {
//       log('$e', name: _tag);
//     }
//   }

//   Future<void> unsubscribeFromTopic({
//     required String topic,
//   }) async {
//     try {
//       await FirebaseMessaging.instance.unsubscribeFromTopic('push_$topic');
//     } catch (e) {
//       log('$e', name: _tag);
//     }
//   }
// }
