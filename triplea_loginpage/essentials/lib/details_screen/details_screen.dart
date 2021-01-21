import 'package:flutter/material.dart';
import 'package:triplea_loginpage/details_screen/body.dart';
//import 'package:triplea_loginpage/announcements.dart';
import 'package:triplea_loginpage/color.dart';


class DetailsScreen extends StatefulWidget {
  final String title, description, image;

  DetailsScreen({this.title, this.description, this.image});

  @override
  _DetailsScreenState createState() => _DetailsScreenState(title, description, image);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String title, description, image;

  _DetailsScreenState(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(title: title, description: description, image: image,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: buttonColor,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
      padding: EdgeInsets.only(left: 20), 
      icon: Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      'Back'.toUpperCase(),
      style: Theme.of(context).textTheme.bodyText2.copyWith(
        color: Colors.white
      ),
    ),
    );
  }
}