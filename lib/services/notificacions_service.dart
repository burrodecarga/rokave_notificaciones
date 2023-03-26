import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPushers {
  ///sha1: F2:29:77:60:2E:FB:55:24:1C:1F:E6:7D:71:9E:ED:C3:37:E5:08:5E
  ///
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static closeStreams() {
    _messageStream.close();
  }

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('background handler: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'No hay data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessageHandler: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'No hay data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp: ${message.messageId}');
    _messageStream.add(message.data['producto'] ?? 'No hay data');
  }

  static Future initializeApp() async {
    //push notifition
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: ${token}');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }
}
