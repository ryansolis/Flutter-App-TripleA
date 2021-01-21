import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:triplea_loginpage/details_screen/details_screen.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/header.dart';

class StudentBody extends StatefulWidget{
  @override 
  _StudentBody createState() => _StudentBody();
}

class _StudentBody extends State<StudentBody>{

  Future getData() async{
    var response = await http.get('https://10.0.2.2/triple_a/announcements.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
                      child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot){
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          List announcement = snapshot.data;
                          Size size = MediaQuery.of(context).size;
                            return Container(
                padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20/2,
                ),
                height: 160,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push (MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                    title: announcement[index]['title'],
                                    description: announcement[index]['description'],
                                    image: announcement[index]['image'],),
                                     ));
                  },
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
                          child: Image.network(
                            "https://10.0.2.2/triple_a/images/"+announcement[index]['image'],
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
                                  announcement[index]['title'],
                                  style: Theme.of(context).textTheme.button.copyWith(
                                         color: titleColor,
                                         fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                child: Text(
                                  announcement[index]['snippet'],
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
                  },                 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
