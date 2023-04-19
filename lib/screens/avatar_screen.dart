import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('JE'),
              backgroundColor: Colors.indigo[900],
            ),
          ),
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage(
              'https://www.aauniv.com/s/blog/wp-content/uploads/2022/03/lenguajes-de-programacion-1024x572.jpeg'),
        ),
      ),
    );
  }
}
