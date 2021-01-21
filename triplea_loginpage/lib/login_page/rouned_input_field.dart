import 'package:flutter/material.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:triplea_loginpage/login_page/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
  @override
  _RoundedInputField createState() => _RoundedInputField();
}

class _RoundedInputField extends State<RoundedInputField> {
  TextEditingController idnum = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: idnum,
        decoration: InputDecoration(
          icon: Icon(Icons.person, color: iconColor),
          hintText: "ID Number",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
