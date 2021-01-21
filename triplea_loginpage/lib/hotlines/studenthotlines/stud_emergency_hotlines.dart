import 'package:flutter/material.dart';
import 'package:triplea_loginpage/studentnavbar.dart';
import 'package:triplea_loginpage/hotlines/studenthotlines/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class StudEmergencyNumbers extends StatefulWidget {
  @override
  _StudEmergencyNumbersState createState() => _StudEmergencyNumbersState();
}

class _StudEmergencyNumbersState extends State<StudEmergencyNumbers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      drawer: NavigationBarScreen(),
      body: SafeArea(
          child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
                right: 15.0,
              ),
              child: Text(
                "Emergency Hotlines",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset('assets/tel-icon.png'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Container(
            width: size.width,
            height: size.height * .795,
            child: StudEmergencyHotlines(),
          ),
        ),
      ])),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }

  //buildMenu() {
  // return Row(
  // mainAxisAlignment: MainAxisAlignment.start,
  //children: <Widget>[
  //Padding(
  //padding: const EdgeInsets.all(5.0),
  //child: MaterialButton(
  // onPressed: () {},
  //height: 50.0,
  //minWidth: 50.0,
  //shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(50.0),
  //),
  //child: Icon(
  //Icons.menu,
  //color: Colors.white,
  //size: 40.0,
  //),
  //),
  //),
  //],
  //);
  //}
}

class StudEmergencyHotlines extends StatefulWidget {
  @override
  _StudEmergencyHotlinesState createState() => _StudEmergencyHotlinesState();
}

class _StudEmergencyHotlinesState extends State<StudEmergencyHotlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildListTile(
            title: 'Safety & Security Dept',
            number: '(032) 261 7741 172',
            //image: AssetImage('images/def-profile.png'),
          ),
          buildListTile(
            title: 'School Clinic',
            number: '(032) 261 7741 118',
            //image: AssetImage('images/def-profile.png'),
          ),
          buildListTile(
            title: 'Backgate Guard Office',
            number: '(032) 261 7741 156',
            //image: AssetImage('images/def-profile.png'),
          ),
          buildListTile(
            title: 'Frontgate Guard Office',
            number: '(032) 261 7741 150',
            //image: AssetImage('images/def-profile.png'),
          ),
          /*buildListTile(
            title: 'XXXXXXX',
            number: 'xx-xxx-xxxx',
            image: AssetImage('images/def-profile.png'),
          ),*/
        ],
      ),
    );
  }

  Widget buildListTile({
    @required String title,
    String number,
    ImageProvider image,
  }) =>
      Card(
        child: ListTile(
          onTap: () {
            dialCall('tel:$number');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          leading: CircleAvatar(
            backgroundColor: kSecondaryColor,
            backgroundImage: image,
            foregroundColor: Colors.white,
            radius: 30,
            child: image == null
                ? Text(
                    title[0].toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                : Container(height: 0, width: 0),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(number),
        ),
      );
}

void dialCall(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'call not possible $url';
  }
}

/*
class StudEmergencyHotlines extends StatelessWidget {
  const StudEmergencyHotlines({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            buildExitButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                    right: 15.0,
                  ),
                  child: Text(
                    "Emergency Hotlines",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset('images/tel-icon.png'),
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: null,
                  child: Text("I'm safe",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
      ],
    );
  }
}
*/
