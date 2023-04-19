import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Text('Titulo alert'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Content alert'),
              SizedBox(height: 15),
              FlutterLogo(size: 80),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            )
          ],
        );
      },
    );
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (builder) {
          return CupertinoAlertDialog(
            title: Text('Titulo alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Aquí iria un poco de parrafor informativo'),
                SizedBox(height: 15),
                FlutterLogo(size: 80),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
            shape: StadiumBorder(),
            elevation: 0,
          ),
          child: Text('Mostrar alerta'),
          onPressed: () => Platform.isAndroid
              ? displayDialog(context)
              : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
