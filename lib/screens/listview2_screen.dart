import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  Listview2Screen({Key? key}) : super(key: key);
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
        title: Text('ListView #2'),
        elevation: 0,
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (_, index) => ListTile(
            leading: Icon(Icons.accessibility_rounded),
            title: Text(options[index]),
            subtitle: Text('That is my subtitle'),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.amber,
            ),
            onTap: () => print('Holi :3'),
          ),
          separatorBuilder: (_, __) => Divider(),
          itemCount: options.length,
        ),
      ),
    );
  }
}
