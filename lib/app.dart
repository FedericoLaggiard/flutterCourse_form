import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        body: LoginScreen(),
      )
    );
  }
}