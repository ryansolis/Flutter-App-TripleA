import 'package:flutter/material.dart';
import 'package:triplea_loginpage/adminalert/admin_emergency_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminEmergencyAlert(),
    );
  }
}
