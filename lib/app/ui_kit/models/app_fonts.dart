import 'package:flutter/cupertino.dart';

class AppFonts {
  TextStyle get header24 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 1.2,
        fontFamily: 'Montserrat',
      );

  TextStyle get header40 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 40,
        height: 1.2,
        fontFamily: 'Montserrat',
      );

  TextStyle get mainText => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 1.1,
        fontFamily: 'Montserrat',
      );

  TextStyle get secText => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.1,
        fontFamily: 'Montserrat',
      );

  TextStyle get secTextItalic => const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontSize: 16,
        height: 1.1,
        fontFamily: 'Montserrat',
      );
}
