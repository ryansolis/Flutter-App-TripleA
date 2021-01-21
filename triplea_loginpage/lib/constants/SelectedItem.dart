import 'package:flutter/material.dart';
import 'package:triplea_loginpage/constants/constants.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    Key key,
    @required this.selectedItem,
  }) : super(key: key);

  final String selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Evacuation Spot"),
        backgroundColor: mainColor,
      ),
      body: Column(children: <Widget>[
        Container(
          height: 520,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Map.png'))),
          //padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 11, bottom: 11),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: mainColor,
          ),
          height: 45,
          width: 480,
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Text(selectedItem,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontSize: 15)),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: mainColor.withOpacity(0.1),
          ),
          height: 160,
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Text("Lorem Ipsum dolor sit amet, consectetur adipiscing elit",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.black, fontSize: 15)),
          ]),
        )
      ]),
    );
  }
}
