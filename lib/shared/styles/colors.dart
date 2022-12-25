import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static const Map<int, Color> color = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(252, 255, 255, .7),
    700: Color.fromRGBO(252, 255, 255, .8),
    800: Color.fromRGBO(252, 255, 255, .9),
    900: Color.fromRGBO(252, 255, 255, 1),
  };

  static const MaterialColor mainSwatchColor = MaterialColor(0xFC6011, color);

  static final Color mainColor = HexColor('#FFFFFF');
  static final Color greyColor = HexColor('#F1F1F1');
}