import 'package:flutter/material.dart';

import 'package:flutter_application_1/theme/app_theme.dart';

class CustomCardPerson extends StatelessWidget {
  const CustomCardPerson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: AppTheme.primaryColor,
            ),
            title: Text('Aqui va mi titulo'),
            subtitle: Text(
                'Adipisicing officia eiusmod veniam ex voluptate labore do non laboris commodo amet reprehenderit aute id. Magna aute do excepteur sunt minim eu aute qui laborum pariatur enim proident aute. Fugiat minim laborum mollit fugiat ad cupidatat do excepteur sint ut eiusmod. Sint sint occaecat qui amet dolor in elit ullamco nulla.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text('Ok'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
