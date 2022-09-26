// ignore_for_file: must_be_immutable

import '../util/exports.dart';


class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingAll20:
        return getPadding(
          all: 20,
        );
      case ButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      default:
        return getPadding(
          all: 17,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillOrange50:
        return Constants.orange50;
      case ButtonVariant.FillAmber100:
        return Constants.amber100;
      case ButtonVariant.OutlineBluegray90019:
        return Constants.whiteA700;
      case ButtonVariant.FillGray100b2:
        return Constants.gray100B2;
      case ButtonVariant.FillWhiteA700:
        return Constants.whiteA700;
      case ButtonVariant.FillGreen50:
        return Constants.green50;
      case ButtonVariant.FillGray100:
        return Constants.gray100;
      case ButtonVariant.FillRed50:
        return Constants.red50;
      case ButtonVariant.FillLightblue50:
        return Constants.lightBlue50;
      case ButtonVariant.FillDeeppurple100:
        return Constants.deepPurple100;
      case ButtonVariant.FillLightblue507f:
        return Constants.lightBlue507f;
      case ButtonVariant.FillGreenA100:
        return Constants.greenA100;
      case ButtonVariant.FillIndigo50:
        return Constants.indigo50;
      case ButtonVariant.OutlineLightblueA70099:
      case ButtonVariant.OutlineIndigo50:
        return null;
      default:
        return null;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigo50:
        return Border.all(
          color: Constants.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineLightblueA70099:
      case ButtonVariant.FillOrange50:
      case ButtonVariant.FillAmber100:
      case ButtonVariant.OutlineBluegray90019:
      case ButtonVariant.FillGray100b2:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGreen50:
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillRed50:
      case ButtonVariant.FillLightblue50:
      case ButtonVariant.FillDeeppurple100:
      case ButtonVariant.FillLightblue507f:
      case ButtonVariant.FillGreenA100:
      case ButtonVariant.FillIndigo50:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      case ButtonShape.RoundedBorder13:
        return BorderRadius.circular(
          getHorizontalSize(
            13.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.FillOrange50:
      case ButtonVariant.OutlineIndigo50:
      case ButtonVariant.FillAmber100:
      case ButtonVariant.OutlineBluegray90019:
      case ButtonVariant.FillGray100b2:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGreen50:
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillRed50:
      case ButtonVariant.FillLightblue50:
      case ButtonVariant.FillDeeppurple100:
      case ButtonVariant.FillLightblue507f:
      case ButtonVariant.FillGreenA100:
      case ButtonVariant.FillIndigo50:
        return null;
      default:
        return LinearGradient(
          begin: Alignment(
            -1.1102230246251565e-16,
            0,
          ),
          end: Alignment(
            0.9999999795108991,
            0.9999995872684941,
          ),
          colors: [
            Constants.lightBlue500,
            Constants.lightBlueA700,
          ],
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray90019:
        return [
          BoxShadow(
            color: Constants.bluegray90019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case ButtonVariant.FillOrange50:
      case ButtonVariant.OutlineIndigo50:
      case ButtonVariant.FillAmber100:
      case ButtonVariant.FillGray100b2:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGreen50:
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillRed50:
      case ButtonVariant.FillLightblue50:
      case ButtonVariant.FillDeeppurple100:
      case ButtonVariant.FillLightblue507f:
      case ButtonVariant.FillGreenA100:
      case ButtonVariant.FillIndigo50:
        return null;
      default:
        return [
          BoxShadow(
            color: Constants.lightBlueA70099,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              15,
            ),
          )
        ];
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium12:
        return TextStyle(
          color: Constants.yellow900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium14:
        return TextStyle(
          color: Constants.bluegray500,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Lime800:
        return TextStyle(
          color: Constants.lime800,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium14Bluegray900:
        return TextStyle(
          color: Constants.bluegray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.SFProDisplayRegular20:
        return TextStyle(
          color: Constants.red500,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProDisplaySemibold20:
        return TextStyle(
          color: Constants.lightBlueA701,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsMedium12Green600:
        return TextStyle(
          color: Constants.green600,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Bluegray500:
        return TextStyle(
          color: Constants.bluegray500,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Red500:
        return TextStyle(
          color: Constants.red500,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsSemiBold14Lightblue700:
        return TextStyle(
          color: Constants.lightBlue700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsMedium14Gray900:
        return TextStyle(
          color: Constants.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.SFProDisplayRegular20LightblueA701:
        return TextStyle(
          color: Constants.lightBlueA701,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium14Indigo700:
        return TextStyle(
          color: Constants.indigo700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Lightblue900:
        return TextStyle(
          color: Constants.lightBlue900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsBlack20:
        return TextStyle(
          color: Constants.lightBlueA701,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        );
      case ButtonFontStyle.PoppinsMedium12Lightblue700:
        return TextStyle(
          color: Constants.lightBlue700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Indigo700:
        return TextStyle(
          color: Constants.indigo700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: Constants.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  RoundedBorder4,
  RoundedBorder13,
}
enum ButtonPadding {
  PaddingAll17,
  PaddingAll6,
  PaddingAll9,
  PaddingAll20,
  PaddingAll13,
}
enum ButtonVariant {
  OutlineLightblueA70099,
  FillOrange50,
  OutlineIndigo50,
  FillAmber100,
  OutlineBluegray90019,
  FillGray100b2,
  FillWhiteA700,
  FillGreen50,
  FillGray100,
  FillRed50,
  FillLightblue50,
  FillDeeppurple100,
  FillLightblue507f,
  FillGreenA100,
  FillIndigo50,
}
enum ButtonFontStyle {
  PoppinsSemiBold14,
  PoppinsMedium12,
  PoppinsMedium14,
  PoppinsMedium12Lime800,
  PoppinsMedium14Bluegray900,
  SFProDisplayRegular20,
  SFProDisplaySemibold20,
  PoppinsMedium12Green600,
  PoppinsMedium12Bluegray500,
  PoppinsMedium12Red500,
  PoppinsSemiBold14Lightblue700,
  PoppinsMedium14Gray900,
  SFProDisplayRegular20LightblueA701,
  PoppinsMedium14Indigo700,
  PoppinsMedium12Lightblue900,
  PoppinsBlack20,
  PoppinsMedium12Lightblue700,
  PoppinsMedium12Indigo700,
}
