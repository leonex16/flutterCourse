import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.00;
  double _height = 50.00;
  Color _color = Colors.pinkAccent;
  BorderRadius _borderRadius = BorderRadius.circular(10.00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
          height: _height,
          width: _width,
          decoration:
            BoxDecoration(borderRadius: _borderRadius, color: _color)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeShape(),
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  void _changeShape() {
    final random = Math.Random();

    setState(() {
      _width = random.nextDouble() * 255;
      _height = random.nextDouble() * 255;
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
      );
    });
  }
}
