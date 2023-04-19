import 'dart:math';

import 'package:flutter/material.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({Key? key}) : super(key: key);

  @override
  _AnimateScreenState createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.amber;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeRamdomSizes() {
    _width = (Random().nextInt(300).toDouble());
    _height = (Random().nextInt(300).toDouble());
    _color = Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
    _borderRadius = BorderRadius.circular((Random().nextInt(70).toDouble()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Width: ' + _width.toString()),
            Text('Height: ' + _height.toString()),
            Text('Border: ' + _borderRadius.toString()),
            Text('Color: ' + _color.toString()),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.play_circle_outline_outlined,
          size: 40,
        ),
        onPressed: () => changeRamdomSizes(),
      ),
    );
  }
}
