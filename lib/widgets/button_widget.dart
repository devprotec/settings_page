import 'package:flutter/material.dart';
import 'package:settings_page/theme/app_style.dart';

import '../util/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final double buttonWidth;
  final Function buttonAction;
  final TextStyle fontStyle;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    required this.buttonColor,
    required this.buttonWidth,
    required this.buttonAction,
    required this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => buttonAction,
      child: Text(
        buttonName,
        style: fontStyle,
      ),
      color: buttonColor,
      elevation: 0,
      minWidth: buttonWidth,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}
