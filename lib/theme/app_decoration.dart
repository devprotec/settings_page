import 'package:settings_page/util/exports.dart';

class AppDecoration {
  static BoxDecoration get outlineLightblue90019 => BoxDecoration(
        color: Constants.whiteA700,
        boxShadow: [
          BoxShadow(
            color: Constants.lightBlue90019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get fillLightblue50 => BoxDecoration(
        color: Constants.lightBlue50,
      );
  static BoxDecoration get outlineGray7000f => BoxDecoration(
        color: Constants.whiteA700,
        boxShadow: [
          BoxShadow(
            color: Constants.gray7000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: Constants.gray100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: Constants.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8.00,
    ),
  );

  static BorderRadius circleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );
}
