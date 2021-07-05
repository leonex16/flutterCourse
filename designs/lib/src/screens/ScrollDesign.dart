import 'package:flutter/material.dart';

class ScrollDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.5],
                colors: [Color(0xFF5EE8C5), Color(0xFF30BAD6)])),
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            Page1(),
            Page2(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Background(), MainContent()],
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Color(0xFF30BAD6),
      height: double.infinity,
      child: Image(image: AssetImage('assets/scroll-1.png')),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white);

    return Container(
      margin: EdgeInsets.only(top: 32.00),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('11°', style: textStyle),
            Text('Miercoles', style: textStyle),
            Expanded(
              child: Container(),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 100.00),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF30BAD6),
      child: Center(
          child: TextButton(
              onPressed: () {},
              child: Text('Bienvenido',
                  style: TextStyle(color: Colors.white, fontSize: 32.00)),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF0098FA),
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.00, vertical: 16.00),
                  shape: StadiumBorder()))),
    );
  }
}
