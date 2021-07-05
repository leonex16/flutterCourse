import 'package:flutter/material.dart';
import 'package:news_app/src/pages/TabsPage.dart';
import 'package:news_app/src/themes/darkTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: darkTheme,
      home: TabsPage()
    );
  }
}