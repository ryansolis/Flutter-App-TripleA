import 'package:flutter/material.dart';
import 'package:triplea_loginpage/adminnavbar.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/personnel_board/personnelbody.dart';

class PersonnelBulletinBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PersonnelBody(), 
      drawer: NavigationBarScreen(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: buttonColor,
      elevation: 0,
      );
  }
}

