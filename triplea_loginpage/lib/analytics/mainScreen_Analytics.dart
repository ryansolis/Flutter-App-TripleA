import 'package:flutter/material.dart';
import 'package:triplea_loginpage/constants/constants.dart';
import '../adminnavbar.dart';
import 'body_Analytics.dart';

class AnalyticsScreen extends StatelessWidget {
  static const routeName = 'mainScreen_Analytics';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: false,
      ),
      drawer: NavigationBarScreen(),
      body: GraphScreen(),
    );
  }
}
