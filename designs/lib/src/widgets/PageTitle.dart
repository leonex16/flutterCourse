import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(16.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify transaction', style: TextStyle( fontSize: 24.00, fontWeight: FontWeight.bold, color: Colors.white )),
            SizedBox( height: 8.00, ),
            Text('Classify this transaciton into a particular category', style: TextStyle( fontSize: 18.00, color: Colors.white )),
          ],
        ),
      ),
    );
  }
}
