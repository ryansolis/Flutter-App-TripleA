/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:triple_a/constants.dart';
//import 'package:triple_a/security_pin_screen.dart';
//import 'package:triple_a/text_label.dart';
//import 'package:triple_a/emergency_btn.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  double percent = 0;
  static int timeMinute = 5;
  int timeSec = timeMinute * 60;

  Timer timer;

  _StartCountdown() {
    timeMinute = 5;
    int time = timeMinute * 60;
    double secPercent = (time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
          if (time % 60 == 0) {
            timeMinute--;
          }
          if (time % secPercent == 0) {
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          timeMinute = 5;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: CircularPercentIndicator(
        percent: percent,
        animation: true,
        animateFromLastPercent: true,
        radius: 250.0,
        lineWidth: 20.0,
        progressColor: kPrimaryColor,
        center: Text("$timeMinute",
            style: TextStyle(
              color: kTextColor,
              fontSize: 80.0,
            )),
      )),
    );
  }
}*/
