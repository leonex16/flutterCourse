import 'package:flutter/material.dart';

import 'package:components_app/src/providers/menu_provider.dart';
import 'package:components_app/src/utils/strToIcon.util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Flutter'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext contextRefLine8,
          AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, contextRefLine8),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? items, BuildContext contextRefLine8) {
    return items!.map((item) {
      return ListTile(
        leading: Icon(strToIcon(item['icon']), color: Colors.blue),
        title: Text(item['texto']),
        trailing: Icon(Icons.keyboard_arrow_right_rounded, color: Colors.blue),
        onTap: () {
          // Option One For Navigate Between Routes
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );
          // Navigator.push(contextRefLine8, route);

          // Option Two - Routes with name
          Navigator.pushNamed(contextRefLine8, item['ruta']);
        },
      );
    }).toList();
  }
}
