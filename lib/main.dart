import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MediAlertApp());
}

class MediAlertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediAlert',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
