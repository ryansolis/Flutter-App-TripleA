import 'dart:io';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/admin_board/adminbulletin_board.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/personnel_board/personnelbulletin_board.dart';
import 'package:triplea_loginpage/student_board/studentbulletin_board.dart';
import 'login_page/login_page.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Triple-A Login',
      theme: ThemeData(
        primaryColor: buttonColor,
        backgroundColor: Colors.white,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/StudentBulletinBoard': (BuildContext context)=> new StudentBulletinBoard(),
        '/AdminBulletinBoard': (BuildContext context)=> new AdminBulletinBoard(),
        '/PersonnelBulletinBoard': (BuildContext context)=> new PersonnelBulletinBoard(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override 
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
    ..badCertificateCallback = 
    (X509Certificate cert, String host, int port) => true;
  }
}










