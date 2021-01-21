import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/personnelnavbar.dart';
import 'package:triplea_loginpage/messaging/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      title: "Sidebar Project",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF610A0C),
          title: Text('Messages'),
        ),
        drawer: NavigationBarScreen(),
        body: Container(
          color: Color(0xFF610A0C),
          child: AppContainer(),
        ),
      ),
    );
  }
}

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<String> menuItems = ["Home", "Dashboard", "Messages", "Settings"];
  final List<String> menuIcons = [
    "icon_home",
    "icon_blogger",
    "icon_blogger",
    "icon_settings"
  ];

  bool sidebarOpen = false;

  double yOffset = 0;
  double xOffset = 60;
  double pageScale = 1;

  int selectedMenuItem = 0;

  String pageTitle = "Messaging";

  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 60;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageTitle() {
    switch (selectedMenuItem) {
      case 0:
        pageTitle = "Messaging";
        break;
      case 1:
        pageTitle = "Dashboard";
        break;
      case 2:
        pageTitle = "Messages";
        break;
      case 3:
        pageTitle = "Settings";
        break;
    }
  }

  DbHelper dbHelper = new DbHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      // transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          //color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.yellowAccent, Colors.deepOrange]),
          borderRadius: sidebarOpen
              ? BorderRadius.circular(20)
              : BorderRadius.circular(0)),
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 24),
              height: 60,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemText;
  final String itemIcon;
  final int selected;
  final int position;
  MenuItem({this.itemText, this.itemIcon, this.selected, this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? Color(0xFFFFCA28) : Color(0xFF610A0C),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/$itemIcon.png")),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
