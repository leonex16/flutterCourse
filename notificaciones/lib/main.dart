import 'package:flutter/material.dart';
import 'package:notificaciones/src/routes/RootRouter.dart';
import 'package:notificaciones/src/services/PushNotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService.messagesStream.listen((productId) {
      final snackBar = new SnackBar(content: Text(productId));
      messengerKey.currentState?.showSnackBar(snackBar);

      navigatorKey.currentState?.pushNamed('message', arguments: productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'Notificaciones',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: RootRouter().router,
    );
  }
}
