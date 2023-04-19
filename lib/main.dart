import 'package:flutter/material.dart';

import 'package:flutter_application_1/router/app_routes.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    configOnesignal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme,
    );
  }

  void configOnesignal() async {
    OneSignal.shared.setAppId('95a4384e-c0df-43e9-aa7a-a57d07eb8ff1');
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      OSNotificationDisplayType.notification;
    });
  }
}
