import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';


class TextFieldd extends StatelessWidget {
  final iconn;
  final String hinttextt;
  final String labeltextt;
  final code;
  final  keyboardType;

  bool obscre;
  TextFieldd({@required this.iconn,this.hinttextt,this.obscre,this.labeltextt,this.code,this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return TextField(

      obscureText: obscre,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hinttextt,
          labelText: labeltextt,
          labelStyle: Textt2.textStyle(kPrimaryfont, 18.0),
          suffixIcon: iconn,
          prefixIcon: code,
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: kPrimaryDark),
          // ),

      ),
    );
  }
}
