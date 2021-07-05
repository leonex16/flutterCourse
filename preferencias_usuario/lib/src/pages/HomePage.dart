import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/sharePrefs/userPreferences.dart';
import 'package:preferencias_usuario/src/widgets/MenuWidget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final preferenciasUsuario = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:
                preferenciasUsuario.secondaryColor ? Colors.teal : Colors.blue,
            title: Text('Preferencias de Usuario')),
        drawer: MenuWidget(),
        body: Column(
          children: [
            Text(
                'Color Secundario: ${preferenciasUsuario.secondaryColor.toString()}'),
            Divider(),
            Text('Género: ${preferenciasUsuario.genero}'),
            Divider(),
            Text('Nombre Usuario: ${preferenciasUsuario.name}'),
            Divider(),
          ],
        ));
  }
}
