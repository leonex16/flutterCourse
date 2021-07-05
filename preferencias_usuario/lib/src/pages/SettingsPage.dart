import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/sharePrefs/userPreferences.dart';
import 'package:preferencias_usuario/src/widgets/MenuWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final preferenciasUsuario = new UserPreferences();
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    preferenciasUsuario.lastPage = SettingsPage.routeName;
    _textEditingController =
        TextEditingController(text: preferenciasUsuario.name);
  }

  void _setSelectedRadio(int value) async {
    preferenciasUsuario.genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:
                preferenciasUsuario.secondaryColor ? Colors.teal : Colors.blue,
            title: Text('Preferencias de Usuario')),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(5.00),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 45.00),
                )),
            Divider(),
            SwitchListTile(
              value: preferenciasUsuario.secondaryColor,
              title: Text('Color Secundario'),
              onChanged: (bool active) =>
                  setState(() => preferenciasUsuario.secondaryColor = active),
            ),
            Divider(),
            RadioListTile(
              value: 1,
              groupValue: preferenciasUsuario.genero,
              title: Text('Masculino'),
              onChanged: (int? value) => _setSelectedRadio(value!),
            ),
            RadioListTile(
              value: 2,
              groupValue: preferenciasUsuario.genero,
              title: Text('Femenino'),
              onChanged: (int? value) => _setSelectedRadio(value!),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.00),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (String text) {},
              ),
            )
          ],
        ));
  }
}
