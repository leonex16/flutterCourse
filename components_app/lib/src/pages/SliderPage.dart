import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _initialValue = 100.00;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image Size: $_initialValue',
      divisions: 6,
      min: 10.00,
      max: 300.00,
      value: _initialValue,
      onChanged: _blockSlider ? null : (val) {
        setState(() => _initialValue = val);
      },
    );
  }

  Widget _createCheckbox() {
    // Opt 1
    // return Checkbox(
    //   value: _blockSlider,
    //   onChanged: (boolean) {
    //     setState(() => _blockSlider = boolean!);
    //   },
    // );

      return CheckboxListTile(
      title: Text('Block Slider'),
      value: _blockSlider,
      onChanged: (boolean) {
        setState(() => _blockSlider = boolean!);
      },
    );
  }

    Widget _createSwitch() {
      return SwitchListTile(
      title: Text('Block Slider'),
      value: _blockSlider,
      onChanged: (boolean) {
        setState(() => _blockSlider = boolean);
      },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      fit: BoxFit.contain,
      width: _initialValue,
      placeholder: AssetImage('assets/loader.gif'),
      image: NetworkImage(
          'https://64.media.tumblr.com/e7a7857c7fcae49497333dc9836863db/tumblr_o6j3hl0VtO1ut9rlvo8_640.jpg'),
    );
  }
}
