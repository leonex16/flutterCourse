// Variant: profileUnitTest
// Config: debug
// Store: C:\Users\HP\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: 4A:52:D9:08:D1:A8:BC:C1:CD:F1:E8:6C:93:EE:C8:63
// SHA1: 46:77:59:53:E6:BE:7E:70:BC:89:6D:49:F1:25:05:A3:94:18:8D:5B
// SHA-256: 83:AD:28:57:52:16:81:00:13:F2:50:EB:EA:69:2E:1D:2F:A4:7B:81:D7:8B:27:86:67:8D:44:61:50:13:66:FA
// Valid until: sßbado 24 de junio de 2051

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static late String? token;
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static StreamController<String> _messageStreamController =
      new StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStreamController.stream;

  // Init Handlers
  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['productId'] ?? 'No Data');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['productId'] ?? 'No Data');
  }

  static Future<void> _onOpenAppHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['productId'] ?? 'No Data');
  }

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('=====================================');
    print(token);

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenAppHandler);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
