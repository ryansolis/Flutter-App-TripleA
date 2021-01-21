import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:triplea_loginpage/admin_board/adminbulletin_board.dart';
import 'package:triplea_loginpage/adminalert/admin_emergency_alert.dart';
import 'package:triplea_loginpage/analytics/mainScreen_Analytics.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/evacuation/mainScreen_EvacuationMap.dart';
import 'package:triplea_loginpage/hotlines/adminhotlines/admin_emergency_hotlines.dart';
import 'package:triplea_loginpage/login_page/login_page.dart';

//import 'hotlines/adminhotlines/admin_emergency_hotlines.dart';

class NavigationBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Triple A",
              style: TextStyle(color: buttonColor),
            ),
            decoration: BoxDecoration(
                color: buttonColor,
                image: DecorationImage(
                    image: AssetImage('assets/LogoTransparent.png'))),
          ),
          ListTile(
              leading: Icon(Icons.notification_important,
                  size: 30, color: buttonColor),
              title: Text("Bulletin Board"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AdminBulletinBoard()))
                  }),
          ListTile(
              leading: Icon(
                Icons.phone_in_talk_rounded,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Hotlines"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AdminEmergencyNumbers()))
                  }),
          ListTile(
              leading: Icon(Icons.mail, size: 30, color: buttonColor),
              title: Text("Messages"),
              onTap: () => {Navigator.of(context).pop()}),
          ListTile(
              leading: Icon(
                Icons.report_problem,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Emergency"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AdminEmergencyAlert()));
              }),
          ListTile(
              leading: Icon(
                Icons.multiline_chart,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AnalyticsScreen.routeName);
              }),
          ListTile(
              leading: Icon(
                Icons.map,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Evacuation Map"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(EvacuationMapScreen.routeName);
              }),
          ListTile(
              leading: Icon(
                Icons.logout,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Log Out"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ))
                  }),
        ],
      ),
    );
  }
}
