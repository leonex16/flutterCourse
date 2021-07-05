import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'), // English, no country code
        const Locale('es', 'ES'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      //home: HomePage(),
      initialRoute: '/',
      routes: routes,
      // onGenerateRoute: (RouteSettings routeSettings) {
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => AlertPage(),
      //   );
      // },
    );
  }
}
