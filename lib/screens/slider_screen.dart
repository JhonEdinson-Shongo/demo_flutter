import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class SliderScreenScreen extends StatefulWidget {
  const SliderScreenScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenScreenState createState() => _SliderScreenScreenState();
}

class _SliderScreenScreenState extends State<SliderScreenScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliders and checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primaryColor,
              divisions: 10,
              value: _sliderValue,
              onChanged: _sliderEnable
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null,
            ),
            Slider(
              min: 50,
              max: 400,
              activeColor: AppTheme.primaryColor,
              // divisions: 10, esta propiedad me deja dividir el valor maximo en secciones
              value: _sliderValue,
              onChanged: _sliderEnable
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null,
            ),
            // Checkbox(
            //   value: _sliderEnable,
            //   onChanged: (value) {
            //     _sliderEnable = value ?? true;
            //     setState(() {});
            //   },
            // ),
            // Switch(
            //   value: _sliderEnable,
            //   onChanged: (value) {
            //     _sliderEnable = value;
            //     setState(() {});
            //   },
            // ),
            CheckboxListTile(
              title: Text('Habilitar slider'),
              activeColor: AppTheme.primaryColor,
              value: _sliderEnable,
              onChanged: (value) {
                _sliderEnable = value ?? true;
                setState(() {});
              },
            ),
            SwitchListTile(
              // adaptive se pone para poner el check de IOs
              title: Text('Habilitar slider'),
              value: _sliderEnable,
              onChanged: (value) {
                _sliderEnable = value;
                setState(() {});
              },
            ),
            AboutListTile(), // Descripción de la aplicación.
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Image(
                  image: NetworkImage(
                      'https://www.pngplay.com/wp-content/uploads/12/Deadpool-Movie-PNG-Photo-Clip-Art-Image.png'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
          ],
        ));
  }
}
