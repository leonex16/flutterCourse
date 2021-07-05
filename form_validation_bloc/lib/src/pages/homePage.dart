import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: AppBar(
          title: Text('Material App Bar'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Center(
          child: Text('Home'),
        ));
  }
}
