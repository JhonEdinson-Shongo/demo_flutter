import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSizeTitle = TextStyle(fontSize: 30.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aquí estamos aprendiendo'),
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador de Shongo',
              style: fontSizeTitle,
            ),
            Text(
              '$counter',
              style: fontSizeTitle,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
          increaseFn: increase, decreaseFn: decrease, restartFn: restart),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function restartFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.restartFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        ),
        FloatingActionButton(
          child: Icon(Icons.restart_alt),
          onPressed: () => restartFn(),
        ),
        FloatingActionButton(
          child: Icon(Icons.plus_one_sharp),
          onPressed: () => increaseFn(),
        ),
      ],
    );
  }
}
