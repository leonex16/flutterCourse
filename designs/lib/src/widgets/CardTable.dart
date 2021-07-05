import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'General'),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'),
          _SigleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'General'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'General'),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'),
        ]),
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SigleCard(
      {required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            radius: 30,
            child: Icon(this.icon, size: 32.00, color: Colors.white),
          ),
          SizedBox(
            height: 24.00,
          ),
          Text(this.text,
              style: TextStyle(
                  color: this.color,
                  fontSize: 18.00,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final boxDecoration = BoxDecoration(
      color: Color.fromRGBO(62, 66, 107, 0.7),
      borderRadius: BorderRadius.circular(20));

  _CardBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.00),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
              height: 180, decoration: boxDecoration, child: this.child),
        ),
      ),
    );
  }
}
