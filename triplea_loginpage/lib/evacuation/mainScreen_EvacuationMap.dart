import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/constants/constants.dart';
import 'package:triplea_loginpage/evacuation/body_EvacuationMap.dart';

import '../adminnavbar.dart';


class EvacuationMapScreen extends StatelessWidget {
  static const routeName = 'mainScreen_EvacuationMap';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          centerTitle: true,
        ),
        drawer: NavigationBarScreen(),
        body: MapScreen());
  }
}
