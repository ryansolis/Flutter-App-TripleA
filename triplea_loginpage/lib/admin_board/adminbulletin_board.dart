import 'package:flutter/material.dart';
import 'package:triplea_loginpage/admin_board/adminbody.dart';
import 'package:triplea_loginpage/adminnavbar.dart';
import 'package:triplea_loginpage/color.dart';

class AdminBulletinBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AdminBody(),
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
