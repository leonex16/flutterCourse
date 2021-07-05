import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Color.fromRGBO(116,117,152, 1),
      selectedItemColor: Colors.pink,
      currentIndex: 0,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today), label: 'Calendario'),
      BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart), label: 'Gráfica'),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle), label: 'Usuarios'),
    ]);
  }
}
