import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:triplea_loginpage/student_alert/constants.dart';

class StudEmergencyAlert extends StatelessWidget {
  const StudEmergencyAlert({
    Key key,
  }) : super(key: key);

  updateSafe() async {
    await http.post(
        'http://192.168.254.104/triple_a_flutter/updateStatusSafe.php',
        body: {'status': "safe"});
  }

  updateHelp() async {
    await http.post(
        'http://192.168.254.104/triple_a_flutter/updateStatusHelp.php',
        body: {'status': "help"});
  }

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
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "EMERGENCY",
                  style: new TextStyle(
                    color: kTextColor,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50.0,
                  ),
                  child: new Text(
                    "ALERT",
                    style: new TextStyle(
                      color: kTextColor,
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ClipOval(
                  child: Container(
                    width: size.width * .8,
                    height: size.height * .5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/distress-btn.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        debugPrint('help Button clicked');
                        updateHelp();
                      },
                      child: null,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90.0,
                  ),
                  child: new Text(
                    "If feel like you are safe, click the button below",
                    style: new TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  color: kPrimaryColor,
                  onPressed: () {
                    debugPrint('safe Button clicked');
                    updateSafe();
                    Navigator.of(context).pop();
                  },
                  child: Text("I'm safe",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
