import 'package:flutter/material.dart';
import 'package:form_validation_bloc/src/blocs/Provider.dart';
import 'package:form_validation_bloc/src/pages/homePage.dart';
import 'package:form_validation_bloc/src/pages/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Validation Bloc Patter',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginPage(),
          'home': (_) => HomePage(),
        },
      ),
    );
  }
}
