import 'package:flutter/material.dart';
import 'package:triplea_loginpage/personnelnavbar.dart';

// ignore: must_be_immutable
class Tracker extends StatelessWidget {
  double _scale = 1.0;
  double _prevscale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF610A0C),
          title: Text('Student Tracker'),
        ),
        drawer: NavigationBarScreen(),
        body: Center(
            child: Column(
          children: [
            Center(
                child: GestureDetector(
                    onScaleStart: (ScaleStartDetails details) {
                      print(details);
                      _prevscale = _scale;
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: Image.asset('assets/citugmap.jpg'),
                    ))),
            Container(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xFF610A0C),
                child: Text('There are 68 students in the campus',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

void main() {
  runApp(Tracker());
}
