import 'package:flutter/material.dart';

import 'exports.dart';

class Constants {
  static Color gray7000f = fromHex('#0f5e5f6d');

  static Color bluegray50 = fromHex('#edeef1');

  static Color gray901 = fromHex('#0b0e23');

  static Color gray900 = fromHex('#0e1339');

  static Color lightBlue700 = fromHex('#0085c8');

  static Color lightBlue500 = fromHex('#00ace9');

  static Color lightBlue50 = fromHex('#cdf1ff');

  static Color lightBlue90019 = fromHex('#190064a7');

  static Color red500 = fromHex('#e74c3c');

  static Color green50 = fromHex('#ebfaf1');

  static Color green600 = fromHex('#24ae5f');

  static Color gray100 = fromHex('#f4f5fa');

  static Color red50 = fromHex('#fff1f0');

  static Color bluegray900 = fromHex('#161b46');

  static Color bluegray800 = fromHex('#343f5e');

  static Color orange50 = fromHex('#fff1e6');

  static Color bluegray500 = fromHex('#6d768d');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color yellow900 = fromHex('#e57e25');

  static Color lightBlueA700 = fromHex('#0095e9');

  static Color lightBlueA70099 = fromHex('#990196ea');
  static Color mainColor = const Color(0xff161B46);

  static Color whiteA700 = fromHex('#ffffff');
  static Color insideIconCircleColor = fromHex('#CDF1FF');
  static Color insideIconColor = fromHex('#CDF1FF');
  static Color forwardIconColor = fromHex('#AEB2BF');
  static Color successPasswordColor = fromHex("#00ACE9");

  static Widget spaceMediumColumn = SizedBox(
    height: 20,
  );
  static Widget spaceSmallColumn = SizedBox(
    height: 10,
  );
  static Widget spaceMediumRow = SizedBox(
    width: 20,
  );
  static Widget spaceLargeColumn = SizedBox(
    width: 30,
  );

  static TextStyle normalTextStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle subtitleTextStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: fromHex('#34405E'));

  static TextStyle languageTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: 'Poppins',
  );

  static TextStyle fainted_logout = TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: fromHex('#6E768D'));

  static Widget arrowBacks (){ 
    return IconButton(
    onPressed: () {
      Get.back();
    },
    icon: Icon(Icons.arrow_back),
    iconSize: 30,
    color: Constants.fromHex('#6E768D'),
  );}

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
