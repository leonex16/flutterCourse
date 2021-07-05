import 'package:disigns/src/screens/BasicDesign.dart';
import 'package:disigns/src/screens/HomeScreen.dart';
import 'package:disigns/src/screens/ScrollDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      initialRoute: 'homeScreen',
      routes: {
        'homeScreen': (_) => HomeScreen(),
        'basicDesign': (_) => BasicDesign(),
        'scrollDesign': (_) => ScrollDesign(),
      },
    );
  }
}
