import 'package:flutter/material.dart';
import 'package:triplea_loginpage/adminalert/constants.dart';

class KeyboardNum extends StatelessWidget {
  final int n;
  final Function onPressed;
  KeyboardNum({
    this.n,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.1),
        ),
        alignment: Alignment.center,
        child: MaterialButton(
          padding: EdgeInsets.all(8.0),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          height: 90.0,
          child: Text(
            "$n",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
