import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert Page'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () => _showAlert(context),
              child: Text('Show Alert'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, shape: StadiumBorder())),
        ));
  }

  void _showAlert(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.00)
          ),
          title: Text('Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This is the body of the alert'),
              SizedBox(height:30.00),
              FlutterLogo(
                size: 50.00,
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text('Exit'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      }
    );
  }
}
