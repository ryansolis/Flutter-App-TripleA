import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/constants/SelectedItem.dart';
import 'package:triplea_loginpage/constants/constants.dart';

class MapScreen extends StatefulWidget {
  MapScreen() : super();
  @override
  MapPage createState() => MapPage();
}

class MapPage extends State<MapScreen> {
  List<String> listItems = [
    "Main Building",
    "HS Building",
    "ST Bulding",
    "Main Canteen",
    "Archi Building",
    "HS Canteen",
    "University Gym",
    "College Canteen"
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          height: 80,
          color: mainColor,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(children: <Widget>[
            Text("Evacuation Map",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontSize: 30)),
            Spacer(),
            IconButton(
                tooltip: 'Pin Location',
                onPressed: () {},
                icon:
                    Icon(Icons.add_location_alt_outlined, color: Colors.white))
          ])),
      Expanded(
          child: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                return OpenContainer(
                  closedElevation: 0,
                  closedBuilder: (context, action) {
                    return ListTile(
                      title: Text(listItems[index]),
                    );
                  },
                  openBuilder: (context, action) {
                    return SelectedItem(selectedItem: listItems[index]);
                  },
                );
              })
        ],
      ))
    ]);
  }
}
