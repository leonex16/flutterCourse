import 'package:flutter/material.dart';
import 'package:form_validation_bloc/src/blocs/loginBloc.dart';
export 'package:form_validation_bloc/src/blocs/loginBloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc);
  }
}
