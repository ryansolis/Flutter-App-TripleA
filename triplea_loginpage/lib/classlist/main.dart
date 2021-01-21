import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../personnelnavbar.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    //get Data from the database
    final response =
        await http.get("https://10.0.2.2/triple_a_flutter/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF610A0C),
        ),
        drawer: NavigationBarScreen(),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  'Class List',
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Color(0xFF610A0C),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        'CSIT321',
                      ),
                    ),
                    Container(
                      child: Text(
                        'F1',
                      ),
                    ),
                  ],
                ),
              ),
              //Container for the legends: safe,missing,help
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Safe',
                    ),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    Text(
                      'Missing',
                    ),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'Help',
                    ),
                  ],
                ),
              ),

              //The commented code below was the original code of the list before having a database

              // Container(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Container(
              //           padding: EdgeInsets.fromLTRB(25.0, 15.0, 0, 0),
              //           child: Row(
              //             children: [
              //               Icon(
              //               Icons.circle,
              //               color: Colors.red,
              //               ),
              //               Text(
              //               'Joshua Carl C. Manigos',
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0),
              //           child: Row(
              //             children: [
              //               Icon(
              //               Icons.circle,
              //               color: Colors.red,
              //               ),
              //               Text(
              //               'Ray Anthony Solis',
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0),
              //           child: Row(
              //             children: [
              //               Icon(
              //               Icons.circle,
              //               color: Colors.yellow,
              //               ),
              //               Text(
              //               'Chezly Christine Lopez',
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0),
              //           child: Row(
              //             children: [
              //               Icon(
              //               Icons.circle,
              //               color: Colors.green,
              //               ),
              //               Text(
              //               'James Clyde Baritua',
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0),
              //           child: Row(
              //             children: [
              //               Icon(
              //               Icons.circle,
              //               color: Colors.green,
              //               ),
              //               Text(
              //               'Robbie Albano',
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              //container for the List taken from the database
              Container(

                  //Change the height that fits the phone you are using
                  //Expanded widget was suppose to be better than using Height but I don't know how (sad)
                  height: 360.0,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (ctx, ss) {
                      if (ss.hasError) {
                        print("error");
                      }
                      if (ss.hasData) {
                        return Items(list: ss.data);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )),

              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(15.0),
                child: RaisedButton(
                  onPressed: () {
                    print("All Clear!");
                  },
                  color: Color(0xFF610A0C),
                  child: Text(
                    'ALL CLEAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Items extends StatelessWidget {
  List list;
  Items({this.list});

  //This is if statements for the color coding of the status.
  //takes the String status of a user from the database
  //(you can change the String status into int example: Safe = 1, Missing = 2, so on...)
  //Was thinking that "Missing" should be default instead of "Absent"... Right now "Missing" is default
  Color colorStatus(String emergencystatus) {
    Color colorstat;

    if (emergencystatus == "safe") {
      colorstat = Colors.green;
      print("green");
    } else if (emergencystatus == "missing") {
      colorstat = Colors.yellow;
      print("yellow");
    } else if (emergencystatus == "help") {
      colorstat = Colors.red;
      print("red");
    } else {
      colorstat = Colors.grey;
      print("gray");
    }

    return colorstat;
  }

  //This is if statements for a proper subtitle of their Status.
  //takes the String status of a user from the database
  //(you can change the String status into int example: Safe = 1, Missing = 2, so on...)
  //Was thinking that "Missing" should be default instead of "Absent"... Right now "Missing" is default
  String textStatus(String emergencystatus) {
    String textStat;

    if (emergencystatus == "safe") {
      textStat = "Safe";
      print("safe");
    } else if (emergencystatus == "missing") {
      textStat = "Missing!";
      print("missing");
    } else if (emergencystatus == "help") {
      textStat = "Needs Help!";
      print("help");
    } else {
      textStat = "Absent";
      print("gray");
    }

    return textStat;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: Icon(Icons.circle,
              color: colorStatus(list[i]['emergencystatus'])),
          title: Text(list[i]['lname'] + ", " + list[i]['fname']),
          subtitle: Text(textStatus(list[i]['emergencystatus'])),
        );
      },
    );
  }
}
