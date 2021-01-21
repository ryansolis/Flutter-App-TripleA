import 'package:flutter/material.dart';
import 'package:triplea_loginpage/color.dart';
import 'announcements.dart';

class AnnouncementsCard extends StatelessWidget {
  const AnnouncementsCard({
    Key key, 
    this.annIndex, 
    this.announcement, this.press,
  }) : super(key: key);

  final int annIndex;
  final Announcement announcement;
  final Function press;
  
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Container(
          padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20/2,
          ),
          height: 160,
          child: InkWell(
            onTap: press,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(35),
                  shadowColor: Colors.white,
                  child: 
                  Container(
                    height: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: shadoweu,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22))
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 160,
                    width: 200,
                    child: Image.asset(
                      announcement.image,
                      fit: BoxFit.cover,
                    ),  
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    width: size.width - 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            announcement.title,
                            style: Theme.of(context).textTheme.button.copyWith(
                                   color: titleColor,
                                   fontWeight: FontWeight.bold,
                                  fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                          child: Text(
                            announcement.snippet,
                            style: Theme.of(context).textTheme.caption.copyWith(
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
  