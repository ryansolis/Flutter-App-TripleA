import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/login_page/background.dart';
import 'package:triplea_loginpage/login_page/rounded_button.dart';
import 'package:http/http.dart' as http;

//import '../student_board/bulletin_board.dart';

class Body extends StatefulWidget{
  @override
  _Body createState() => _Body();
}


class _Body extends State<Body> {

  bool isHidden = true;

  void toggleVisibility(){
    setState(() {
      isHidden = !isHidden; //toggle visibility for password
    });
  }
  
  TextEditingController idnum = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg='';
  // ignore: missing_return
  Future<List> _login() async{

    final response = await http.post("https://10.0.2.2/triple_a/login.php",
    body: {
      "id_number" : idnum.text,
      "password" : pass.text,
    }
    );
    
    var datauser = json.decode(response.body);
    
    if(datauser.length == 0){
      setState(() {
        msg="Login Failed";
      });
    }
    else{
      if(datauser[0]['level']=='admin'){
        Navigator.pushReplacementNamed(context, '/AdminBulletinBoard');
      }
      else if(datauser[0]['level']=='student'){
        Navigator.pushReplacementNamed(context, '/StudentBulletinBoard');
      }
      else if(datauser[0]['level']=='personnel'){
        Navigator.pushReplacementNamed(context, '/PersonnelBulletinBoard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height*0.10),
            Image.asset(
              'assets/Logo.png', 
              height: 55,
            ),  
           Text(
             "Triple A",
             style: TextStyle(
               color: titleColor, 
               fontWeight: FontWeight.bold,
               fontSize: 27,
              ),
            ),
            Text(
             "Emergency Response and Navigation",
             style: TextStyle(
               color: iconColor, 
               fontWeight: FontWeight.bold,
               fontSize: 10,
              ),
            ),
            SizedBox(height: size.height*0.01),
            Image.asset(
              'assets/people.png', 
              height: size.height*0.35,
            ),
            SizedBox(height: size.height*0.01),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal:20, vertical: 1),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: iconColor),
              ),
              child: 
                TextField(
                controller: idnum,
                decoration: InputDecoration(
                icon: Icon(Icons.person, color: iconColor),
                hintText: "ID Number",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
               ),
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal:20, vertical: 1),
            width: size.width * 0.8,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
             border: Border.all(color: iconColor),
            ),
            child: TextField(
            controller: pass,
            obscureText: isHidden,
            decoration: 
            InputDecoration(
            hintText: "Password",
            icon: Icon(Icons.lock, color: iconColor),
            suffixIcon: IconButton( 
              color: iconColor, 
              onPressed: toggleVisibility,
              icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              ),
            border: InputBorder.none,
              ),
            ),
          ),
            SizedBox(height: size.height*0.01),
            RoundedButton(
              text: "Sign In", 
              press: () {
                _login();
              },
            ),
            Text(
              msg,
              style: 
              TextStyle(fontSize: 16,
              color: Colors.red),              
            )
          ]
        ),
      ),
    );
  }
}