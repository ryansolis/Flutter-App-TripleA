import 'package:flutter/material.dart';
import 'package:triplea_loginpage/color.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height*0.1 + 15,
        color: buttonColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height*0.1+15,
              width: size.width,
              padding: EdgeInsets.only(bottom: 20, left: 70),
              child: Row(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                    'Bulletin Board',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                    ),
                    Text(
                      'Announcements that you need to know',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(top: 5,left: 5, right: 18),
                      child: Column(
                        children: [
                          Image.asset('assets/speaker.png', 
                          height: 60,
                          width: 60,)
                        ],
                      ),
                    ),
                  ],),
                ], 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

