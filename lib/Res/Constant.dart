import 'package:flutter/material.dart';


const kPrimarycolor=Color(0xff1280CD);
const kPrimaryfont=Color(0xff2A2B50);
const kSecondaryfont=Color(0xff092C4C);

Color kPink = Color(0xFFEE4CBF);
Color kRed = Color(0xFFFA3754);
Color kBlue = Color(0xFF4AA3F2);
Color kPurple = Color(0xFFAF92FB);


class Textt1{

  static TextStyle textStyle(Color color,double fontsize)
  {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: FontWeight.w600,
    );
  }
}


class Textt2{

  static TextStyle textStyle(Color color,double fontsize)
  {
    return TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w700
    );
  }
}
