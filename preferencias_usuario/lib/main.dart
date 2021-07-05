import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/HomePage.dart';
import 'package:preferencias_usuario/src/pages/SettingsPage.dart';
import 'package:preferencias_usuario/src/sharePrefs/userPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferenciasUsuario = new UserPreferences();
  await preferenciasUsuario.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final preferenciasUsuario = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Preferencias',
        initialRoute: preferenciasUsuario.lastPage,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          SettingsPage.routeName: (_) => SettingsPage(),
        });
  }
}
