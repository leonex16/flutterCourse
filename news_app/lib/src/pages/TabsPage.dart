import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'label'),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'label'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
//      physics: BouncingScrollPhysics(),
      children: [
        Container(color: Colors.blue,),
        Container(color: Colors.red,),
      ],
    );
  }
}