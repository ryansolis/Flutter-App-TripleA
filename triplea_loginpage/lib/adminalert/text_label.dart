import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final double bottomPadding, topPadding;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;

  const TextLabel({
    Key key,
    this.text,
    this.bottomPadding,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            bottom: bottomPadding,
            top: topPadding,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
