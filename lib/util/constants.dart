import 'exports.dart';

class Constants {
  static Color indigo50 = fromHex('#e6e8f3');
  static Color gray7000f = fromHex('#0f5e5f6d');
  static Color bluegray200 = fromHex('#aeb2bf');
  static Color bluegray50 = fromHex('#edeef1');
  static Color purple300 = fromHex('#b75fdb');
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
  static Color gray150 = fromHex('#e1e8ed');

  static Color red50 = fromHex('#fff1f0');

  static Color bluegray900 = fromHex('#161b46');

  static Color bluegray800 = fromHex('#343f5e');

  static Color orange50 = fromHex('#fff1e6');

  static Color bluegray500 = fromHex('#6d768d');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color yellow900 = fromHex('#e57e25');

  static Color lightBlueA700 = fromHex('#0095e9');
  static Color errorBackgroundcolor = Color(0xffFFF2F0);
  static Color errorColor = Color(0xffE74C3C);
  static Color successColor = fromHex('#24AE5F');
  static Color successBacgroundColor = fromHex('#EBFBF2');

  static Color lightBlueA70099 = fromHex('#990196ea');
  static Color mainColor = const Color(0xff161B46);
  static Color bottomSheetTextColor = fromHex('#007AF');

  static Color whiteA700 = fromHex('#ffffff');
  static Color insideIconCircleColor = fromHex('#CDF1FF');
  static Color insideIconColor = fromHex('#CDF1FF');
  static Color forwardIconColor = fromHex('#AEB2BF');
  static Color successPasswordColor = fromHex("#00ACE9");
  static Color inactiveStatusColorGray = fromHex("#F4F5FB");
  static Color activeIconColor = fromHex("#0199E9");
  static Color inactiveIconColor = fromHex("#6E768D");
  static Color pendingCircleColor = fromHex("#FFF2E7");
  static Color horizontalLineColor = fromHex("#E6E8F3");
  static Color bluegray504 = fromHex('#6e768d');
  static Color indigo700 = fromHex('#454e90');
  static Color deepPurple100 = fromHex('#d4d9f5');
  static Color bluegray90066 = fromHex('#66151b46');
  static Color red51 = fromHex('#fff2f0');

  static Widget spaceMediumColumn = SizedBox(
    height: 20,
  );
  static Widget spaceExtraSmallColumn = SizedBox(
    height: 8,
  );
  static Widget spaceSemiMediumColumn = SizedBox(
    height: 16,
  );
  static Widget spaceExtraMediumColumn = SizedBox(
    height: 24,
  );
  static Widget spaceSmallColumn = SizedBox(
    height: 10,
  );
  static Widget spaceMediumRow = SizedBox(
    width: 20,
  );
  static Widget spaceLargeColumn = SizedBox(
    height: 30,
  );
  static Widget spaceSmallRow = SizedBox(
    width: 10,
  );
  static Widget spaceSemiBigColumn = SizedBox(
    height: 30,
  );

  static TextStyle normalTextStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle titleTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle titleTextStyleWhite = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle subtitleTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: fromHex('#34405E'),
  );

  static TextStyle inactiveSubtitleTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: fromHex('#6E768D'),
  );

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

  static Widget arrowBacks({Color? color}) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Icon(Icons.arrow_back, color: color),
    );
  }

  static Widget trailingWidget(String iconLocation, VoidCallback voidCallback,
      {Color? color}) {
    return GestureDetector(
        onTap: voidCallback,
        child: CommonImageView(
          svgPath: iconLocation,
          color: color,
        ));
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}


// import 'exports.dart';

// class Constans {
//   static Color gray7000f = fromHex(‘#0f5e5f6d’);
//   static Color bluegray50 = fromHex(‘#EDEEF1’);
//   static Color gray901 = fromHex(‘#0B0E23’);
//   static Color gray900 = fromHex(‘#0E1339’);
//   static Color lightBlue700 = fromHex(‘#0085C8’);
//   static Color lightBlue500 = fromHex(‘#00ACE9’);
//   static Color lightBlue50 = fromHex(‘#CDF1FF’);
//   static Color lightBlue90019 = fromHex(‘#190064a7’);
//   static Color red500 = fromHex(‘#E74C3C’);
//   static Color green50 = fromHex(‘#EBFAF1’);
//   static Color green600 = fromHex(‘#24AE5F’);
//   static Color gray100 = fromHex(‘#F4F5FA’);
//   static Color red50 = fromHex(‘#FFF1F0’);
//   static Color bluegray900 = fromHex(‘#161B46’);
//   static Color bluegray800 = fromHex(‘#343F5E’);
//   static Color orange50 = fromHex(‘#FFF1E6’);
//   static Color bluegray500 = fromHex(‘#6D768D’);
//   static Color black900 = fromHex(‘#000000’);
//   static Color bluegray400 = fromHex(‘#888888’);
//   static Color yellow900 = fromHex(‘#E57E25’);
//   static Color lightBlueA700 = fromHex(‘#0095E9’);
//   static Color errorBackgroundcolor = Color(0xffFFF2F0);
//   static Color errorColor = Color(0xffE74C3C);
//   static Color successColor = fromHex(‘#24AE5F’);
//   static Color successBacgroundColor = fromHex(‘#EBFBF2’);
//   static Color lightBlueA70099 = fromHex(‘#990196ea’);
//   static Color mainColor = const Color(0xff161B46);
//   static Color whiteA700 = fromHex(‘#FFFFFF’);
//   static Color insideIconCircleColor = fromHex(‘#CDF1FF’);
//   static Color insideIconColor = fromHex(‘#CDF1FF’);
//   static Color forwardIconColor = fromHex(‘#AEB2BF’);
//   static Color successPasswordColor = fromHex(“#00ACE9”);
//   static Color inactiveStatusColorGray = fromHex(“#F4F5FB”);
//   static Color activeIconColor = fromHex(“#0199E9”);
//   static Color inactiveIconColor = fromHex(“#6E768D”);
//   static Color pendingCircleColor = fromHex(“#FFF2E7”);
//   static Color horizontalLineColor = fromHex(“#E6E8F3");
//   static Color bottomSheetTextColor = fromHex(“#007AFF”);
//   static Widget spaceMediumColumn = SizedBox(
//     height: 20,
//   );
//   static Widget spaceExtraSmallColumn = SizedBox(
//     height: 8,
//   );
//   static Widget spaceSemiMediumColumn = SizedBox(
//     height: 16,
//   );
//   static Widget spaceExtraMediumColumn = SizedBox(
//     height: 24,
//   );
//   static Widget spaceSmallColumn = SizedBox(
//     height: 10,
//   );
//   static Widget spaceMediumRow = SizedBox(
//     width: 20,
//   );
//   static Widget spaceLargeColumn = SizedBox(
//     width: 30,
//   );
//   static Widget spaceSemiBigColumn = SizedBox(
//     height: 30,
//   );
//   static TextStyle normalTextStyle = TextStyle(
//       fontSize: 16,
//       fontFamily: ‘Poppins’,
//       fontWeight: FontWeight.w500,
//       color: Colors.black);
//   static TextStyle titleTextStyle = TextStyle(
//     fontSize: 18,
//     fontFamily: ‘Poppins’,
//     fontWeight: FontWeight.w600,
//     color: Colors.black,
//   );
//   static TextStyle titleTextStyleWhite = TextStyle(
//     fontSize: 18,
//     fontFamily: ‘Poppins’,
//     fontWeight: FontWeight.w600,
//     color: Colors.white,
//   );
//   static TextStyle subtitleTextStyle = TextStyle(
//     fontSize: 14,
//     fontFamily: ‘Poppins’,
//     fontWeight: FontWeight.w400,
//     color: fromHex(‘#34405E’),
//   );
//   static TextStyle inactiveSubtitleTextStyle = TextStyle(
//     fontSize: 14,
//     fontFamily: ‘Poppins’,
//     fontWeight: FontWeight.w400,
//     color: fromHex(‘#6E768D’),
//   );
//   static TextStyle languageTextStyle = TextStyle(
//     fontWeight: FontWeight.w400,
//     fontSize: 16,
//     fontFamily: ‘Poppins’,
//   );
//   static TextStyle fainted_logout = TextStyle(
//       fontSize: 16,
//       fontFamily: ‘Poppins’,
//       fontWeight: FontWeight.w600,
//       color: fromHex(‘#6E768D’));
//   static Widget arrowBacks({Color? color}) {
//     return GestureDetector(
//       onTap: () => Get.back(),
//       child: Icon(
//         Icons.arrow_back,
//         color: color ?? Constants.fromHex(‘#6E768D’),
//       ),
//     );
//   }
//   static Widget trailingWidget(String iconLocation, VoidCallback voidCallback,
//       {Color? color}) {
//     return GestureDetector(
//         onTap: voidCallback,
//         child: CommonImageView(
//           svgPath: iconLocation,
//           color: color,
//         ));
//   }
//   static Color fromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write(‘ff’);
//     buffer.write(hexString.replaceFirst(‘#’, ‘’));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }
// }