import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:form_validation_bloc/src/blocs/Provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        body: Stack(children: [
          _createBackground(context),
          _loginForm(context),
        ]));
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundGradient = Container(
        height: size.height * 0.40,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffff9800),
              Color(0xddc66900),
            ])));

    return Stack(
      children: [
        backgroundGradient,
        _createCircle(size),
        _createCircle(size),
        _createCircle(size),
        _createCircle(size),
        _createCircle(size),
        _createCircle(size),
        _logo()
      ],
    );
  }

  Widget _logo() {
    return Container(
        padding: EdgeInsets.only(top: 80.00),
        child: Column(
          children: [
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 100.00,
            ),
            SizedBox(height: 24.00, width: double.infinity),
            Text(
              'Leonel Espinoza',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ));
  }

  Widget _createCircle(Size size) {
    final random = new Random();
    final double sizeCircle = random.nextInt(100).toDouble();

    return Positioned(
      top: random.nextInt((size.height * 0.35).toInt()).toDouble(),
      left: random.nextInt((size.width).toInt()).toDouble(),
      child: Container(
          height: sizeCircle,
          width: sizeCircle,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.00),
              color: Color(0x10FFFFFF))),
    );
  }

  Widget _loginForm(BuildContext context) {
    final LoginBloc bloc = Provider.of(context);
    final Size size = MediaQuery.of(context).size;

    final boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.00)]);

    final textStyle = TextStyle(
        color: Colors.black, fontSize: 24.00, fontWeight: FontWeight.bold);

    return SingleChildScrollView(
        child: SafeArea(
      child: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: size.height * 0.32),
                padding:
                    EdgeInsets.symmetric(horizontal: 16.00, vertical: 16.00),
                width: size.width * 0.85,
                decoration: boxDecoration,
                child: Column(children: [
                  Text('Ingreso', style: textStyle),
                  SizedBox(
                    height: 16.00,
                  ),
                  _inputEmail(bloc),
                  SizedBox(
                    height: 16.00,
                  ),
                  _inputPassword(bloc),
                  SizedBox(
                    height: 16.00,
                  ),
                  _inputSubmit(),
                ])),
            Container(
                padding: EdgeInsets.only(top: 16.00),
                child: Text('¿Olvido su contraseña?',
                    style: TextStyle(color: Colors.white, fontSize: 16.00))),
          ],
        ),
      ),
    ));
  }

  Widget _inputEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: (text) => bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo Electrónico',
                counterText: snapshot.data
              // errorText: snapshot.error
                ),
          );
        });
  }

  Widget _inputPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: (text) => bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline),
              focusColor: Colors.orange,
              hintText: '*******',
              labelText: 'Contraseña',
              counterText: snapshot.data,
              // errorText: snapshot.error
              ),
        );
      },
    );
  }

  Widget _inputSubmit() {
    final styleElevatedButton = ElevatedButton.styleFrom(
        primary: Colors.orange,
        elevation: 0,
        padding: EdgeInsets.all(12.00),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.00)));

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Entrar', style: TextStyle(fontSize: 16.00)),
        style: styleElevatedButton,
        onPressed: () {},
      ),
    );
  }
}
