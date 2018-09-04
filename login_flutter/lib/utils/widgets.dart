import 'package:flutter/material.dart';
class MyWidgets extends StatefulWidget{
   

  @override
  State<StatefulWidget> createState() {
    
  }
  textbox(var varName, bool autoFocus, bool obscureText, String hint,
      var controller, String validateMsg) {
    varName = TextFormField(
      autofocus: autoFocus,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return validateMsg;
      },
    );
    return varName;
  }

 
}