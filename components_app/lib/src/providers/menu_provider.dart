import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final String response = await rootBundle.loadString('data/menu_opts.json');
    final Map dataMap = json.decode(response);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
