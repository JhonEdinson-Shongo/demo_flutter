import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  ListviewScreen({Key? key}) : super(key: key);
  final options = [
    'option #1',
    'option #2',
    'option #3',
    'option #4',
    'option #5',
    'option #6'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView #1'),
      ),
      body: Center(
        child: ListView(
          children: [
            ...options
                .map(
                  (e) => ListTile(
                    leading: Icon(Icons.accessibility_rounded),
                    title: Text('$e'),
                    subtitle: Text('That is my subtitle'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
