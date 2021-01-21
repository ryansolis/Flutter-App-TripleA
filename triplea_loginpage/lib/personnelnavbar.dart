import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:triplea_loginpage/classlist/main.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/hotlines/personnelhotlines/personnel_emergency_hotlines.dart';
import 'package:triplea_loginpage/login_page/login_page.dart';
import 'package:triplea_loginpage/messaging/main.dart';
import 'package:triplea_loginpage/personnel_board/personnelbulletin_board.dart';
import 'package:triplea_loginpage/tracker/main.dart';

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
                                PersonnelBulletinBoard()))
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
                                PersonnelEmergencyNumbers()))
                  }),
          ListTile(
              leading: Icon(Icons.mail, size: 30, color: buttonColor),
              title: Text("Messages"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()))
                  }),
          ListTile(
              leading: Icon(
                Icons.list,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Classlist"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()))
                  }),
          ListTile(
              leading: Icon(
                Icons.pin_drop,
                size: 30,
                color: buttonColor,
              ),
              title: Text("Track Students"),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Tracker()))
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
