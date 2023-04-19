import 'package:flutter/material.dart';

import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/router/app_Routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes en flutter'),
        elevation: 1,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(AppRoutes.menuOption[index].name),
          leading: Icon(
            AppRoutes.menuOption[index].icon,
            color: AppTheme.primaryColor,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppTheme.primaryColor,
          ),
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.menuOption[index].route),
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: AppRoutes.menuOption.length,
      ),
    );
  }
}
