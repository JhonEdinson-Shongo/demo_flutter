import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isBiometricAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    bool isAvailable = await _localAuthentication.canCheckBiometrics;
    setState(() {
      _isBiometricAvailable = isAvailable;
    });
    if (_isBiometricAvailable) {
      _authenticateUser();
    }
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = await _localAuthentication.authenticate(
      localizedReason: 'Por favor, autentica para continuar',
      biometricOnly: true,
      useErrorDialogs: true,
      stickyAuth: true,
    );
    if (isAuthenticated) {
      print('Se pudo autenticar');
    } else {
      print('No se pudo autenticar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AuthScreen'),
      ),
    );
  }
}
