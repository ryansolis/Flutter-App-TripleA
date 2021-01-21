import 'package:flutter/material.dart';
import 'package:triplea_loginpage/adminalert/constants.dart';
import 'package:triplea_loginpage/adminalert/emergency_btn.dart';
import 'package:triplea_loginpage/adminalert/security_pin_screen.dart';
import 'package:triplea_loginpage/adminalert/text_label.dart';

class AdminEmergencyAlert extends StatelessWidget {
  const AdminEmergencyAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Triple A'),
        backgroundColor: Color(0xFF3F8F8B),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextLabel(
              text: "EMERGENCY",
              bottomPadding: 0,
              topPadding: 0,
              fontColor: kTextColorYel,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            TextLabel(
              text: "ALERT",
              bottomPadding: 50.0,
              topPadding: 0,
              fontColor: kTextColorYel,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            EmergencyButton(
              imageBtn: AssetImage('assets/enable-btn.png'),
              onHold: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SecurityPinScreen();
                  }),
                );
              },
            ),
            TextLabel(
              text: "If all clear, click the button below",
              bottomPadding: 1.0,
              topPadding: 90.0,
              fontColor: Colors.black,
              fontSize: 11.0,
              fontWeight: FontWeight.w100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width * .55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: MaterialButton(
                      color: kSecondaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("cancel",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
