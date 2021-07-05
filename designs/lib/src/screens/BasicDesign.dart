import 'package:flutter/material.dart';

class BasicDesign extends StatelessWidget {
  const BasicDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/landscape.jpg')),
          Title(),
          ButtonSection(),
          Container(
            margin: EdgeInsets.symmetric( horizontal: 24.00, vertical: 16.00),
            child: Text('Lorem ipsum dolor sit amet Latin, consectetur adipiscing elit Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Latin, consectetur adipiscing elit Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Latin, consectetur adipiscing elit Lorem ipsum dolor sit amet'))
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.00, vertical: 32.00),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'subtitle',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.00),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CustomButton(icon: Icons.call, text: 'Call'),
        CustomButton(icon: Icons.map_sharp, text: 'Route'),
        CustomButton(icon: Icons.share, text: 'Search'),
        ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomButton({
    required this.icon,
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.blue,
          size: 32.00,
        ),
        Text(
          this.text,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
