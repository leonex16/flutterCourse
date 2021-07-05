import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> options = ['One', 'Two', 'Three', 'Four', 'Five', 'Six'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components App'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    return options.map((opt) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text(opt),
            subtitle: Text('Subtitle'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(thickness: 1.0),
        ],
      );
    }).toList();
  }
}
