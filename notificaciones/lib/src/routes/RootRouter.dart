import 'package:flutter/material.dart';
import 'package:notificaciones/src/page/HomePage.dart';
import 'package:notificaciones/src/page/MessagePage.dart';

class RootRouter{
  final Map<String, Widget Function(BuildContext)> router = {
    'home': (_) => HomePage(),
    'message': (_) => MessagePage(),
  };
}