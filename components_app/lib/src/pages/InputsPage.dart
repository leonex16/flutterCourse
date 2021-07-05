import 'dart:ui';

import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  TextEditingController _dateController = TextEditingController();
  String _date = '';
  List<String> _dropdownOpt = ['One', 'Two', 'Three', 'Four'];
  String _selectedOpt = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs Page'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.00, vertical: 5.00),
          children: [
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
            Divider(),
            _createDropdown(),
            Divider(),
            _createPerson(),
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.00),
          ),
          counter: Text('Letters ${_name.length}'),
          hintText: 'Your Name',
          labelText: 'Name',
          helperText: 'Just you need write your name',
          suffixIcon: Icon(Icons.ac_unit),
          icon: Icon(Icons.account_circle)),
      onChanged: (text) => setState(() => _name = text),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.00),
          ),
          hintText: 'Your Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.ac_unit),
          icon: Icon(Icons.alternate_email)),
      onChanged: (text) => setState(() => _email = text),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.00),
          ),
          hintText: 'Create Password',
          labelText: 'Password',
          icon: Icon(Icons.password)),
      onChanged: (text) => setState(() => _password = text),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.00),
          ),
          hintText: 'Born date',
          labelText: 'Born date',
          icon: Icon(Icons.date_range)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        locale: Locale(
            'es') // https://flutter.dev/docs/development/accessibility-and-localization/internationalization#setting-up
        );

    if (picker != null) {
      setState(() {
        _date = picker.toString();
        _dateController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(width: 20.00),
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.00, vertical: 4.00),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.00),
              border: Border.all(width: 1.00, color: Colors.grey)),
          child: DropdownButton(
            isExpanded: true,
            value: _selectedOpt,
            items: getOptionsDropdown(),
            hint: new Text('Select an option'),
            onChanged: (opt) {
              setState(() => _selectedOpt = opt.toString());
            },
          ),
        ),
      )
    ]);
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> listOpt = [];

    _dropdownOpt.forEach((opt) {
      listOpt
        ..add(DropdownMenuItem(
          child: Text(opt),
          value: opt,
        ));
    });

    return listOpt;
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Option Selected: $_selectedOpt'),
    );
  }
}
