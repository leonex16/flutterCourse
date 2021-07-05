import 'dart:async';

import 'package:form_validation_bloc/src/blocs/validators.dart';

class LoginBloc with Validators {
  final _emailController = new StreamController<String>.broadcast();
  final _passwordController = new StreamController<String>.broadcast();

  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Recuperar datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform( emailValidate );
  Stream<String> get passwordStream => _passwordController.stream.transform( passwordValidate );

  dipose() {
    _emailController.close();
    _passwordController.close();
  }
}
