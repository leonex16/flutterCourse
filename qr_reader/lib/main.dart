import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/src/pages/HomePage.dart';
import 'package:qr_reader/src/pages/MapPage.dart';
import 'package:qr_reader/src/providers/ScanListProvider.dart';
import 'package:qr_reader/src/providers/UiProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.teal;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(
                  color: primaryColor,
                ),
                selectedItemColor: primaryColor),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: primaryColor,
            )),
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'map': (_) => MapPage(),
        },
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}
