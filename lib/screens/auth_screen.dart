import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _successLogin = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    final availableBiometrics = await _localAuthentication.isDeviceSupported();
    try {
      if (!availableBiometrics) return;
      _authenticateUser();
    } catch (e) {
      print('cant Launch');
      print(e);
    }
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = await _localAuthentication.authenticate(
      androidAuthStrings: AndroidAuthMessages(
        signInTitle: 'Sign in',
        cancelButton: 'No thanks',
      ),
      iOSAuthStrings: IOSAuthMessages(
        cancelButton: 'No thanks',
      ),
      localizedReason: '-',
      biometricOnly: true,
      useErrorDialogs: false,
      stickyAuth: true,
    );
    if (isAuthenticated) {
      setState(() {
        _successLogin = true; //958121896
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _successLogin
                ? Text('Login Success')
                : TextButton(
                    onPressed: () => _checkBiometricAvailability(),
                    child: Text('Login FaceID'),
                  ),
          ),
          TextButton(
            onPressed: () => _checkBiometricAvailability(),
            child: Text('Login FaceID'),
          ),
        ],
      ),
    );
  }
}
