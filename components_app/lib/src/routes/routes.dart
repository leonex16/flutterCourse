import 'package:flutter/material.dart';

import 'package:components_app/src/pages/AlertPage.dart';
import 'package:components_app/src/pages/AnimatedContainerPage.dart';
import 'package:components_app/src/pages/AvatarPage.dart';
import 'package:components_app/src/pages/CardPage.dart';
import 'package:components_app/src/pages/HomePage.dart';
import 'package:components_app/src/pages/InputsPage.dart';
import 'package:components_app/src/pages/listViewPage.dart';
import 'package:components_app/src/pages/SliderPage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  'avatar': (BuildContext context) => AvatarPage(),
  'card': (BuildContext context) => CardPage(),
  'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
  'inputs': (BuildContext context) => InputsPage(),
  'slider': (BuildContext context) => SliderPage(),
  'list': (BuildContext context) => ListViewPage(),
};
