import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              // SystemChrome.setPreferredOrientations(DeviceOrientation.values)
              Text(
                  'Si queremos quitar la rotación para Ios sebemos ir a el xCode y en la parte del Runner en General, Deployment Info, se deselecciona Down, Left, Right. Para el caso de Android hay que ir al AndroidManifest y en Aplication > Activity: se agrega android:screenOrientation="portrait"'),
              SizedBox(height: 20),
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration.zero,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 1 : 2,
                      mainAxisExtent: 200,
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCreditCardWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
