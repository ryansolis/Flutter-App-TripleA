import 'package:flutter/material.dart';
import 'package:triplea_loginpage/login_page/text_field_container.dart';
import 'package:triplea_loginpage/color.dart';

class RoundedPasswordField extends StatefulWidget {
  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordField> {
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: pass,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock, color: iconColor),
          suffixIcon: Icon(Icons.visibility, color: iconColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
