import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:triplea_loginpage/adminalert/admin_emergency_alert.dart';
import 'package:triplea_loginpage/adminalert/constants.dart';
import 'package:triplea_loginpage/adminalert/text_label.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;
  bool pressedEnable = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  activateAlert() {
    var url = 'http://192.168.0.106/triple_a/alertActivated.php';
    http.post(url);
  }

  deactivateAlert() {
    var url = 'http://192.168.0.106/triple_a/alertDeactivated.php';
    http.post(url);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 5),
    );
  }

  countdownComplete() {
    if (controller.isCompleted) {
      controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    countdownComplete();

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: kPrimaryColor,
                                    color: Colors.white,
                                  )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "EMERGENCY",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: kTextColorYel,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0, color: kTextColor),
                                      ),
                                      Text(
                                        "Sends alert every 5 minutes",
                                        style: TextStyle(
                                            fontSize: 15.0, color: kTextColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      pressedEnable
                          ? TextLabel(
                              text: "If all clear, click cancel",
                              bottomPadding: 1.0,
                              topPadding: 90.0,
                              fontColor: kTextColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w100,
                            )
                          : TextLabel(
                              text: "Enable emergency alert",
                              bottomPadding: 1.0,
                              topPadding: 90.0,
                              fontColor: kTextColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w100,
                            ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                backgroundColor: kSecondaryColor,
                                onPressed: () {
                                  if (!controller.isAnimating) {
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                    controller.repeat();
                                    activateAlert();
                                  } else {
                                    controller.stop();
                                    deactivateAlert();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }
                                  setState(() {
                                    pressedEnable = !pressedEnable;
                                  });
                                },
                                icon: Icon(controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow),
                                label: Text(controller.isAnimating
                                    ? "     Cancel Now      "
                                    : "     Enable Now      "));
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
