import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  final AssetImage imageBtn;
  final Function onHold;

  const EmergencyButton({
    Key key,
    this.imageBtn,
    this.onHold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: Container(
            width: size.width * .8,
            height: size.height * .4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageBtn,
                fit: BoxFit.fill,
              ),
            ),
            child: FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: onHold,
              child: null,
            ),
          ),
        ),
      ],
    );
  }
}
