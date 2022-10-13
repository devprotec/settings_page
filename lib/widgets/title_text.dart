import 'package:flutter/cupertino.dart';

import '../util/constants.dart';


class TitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  // ignore: use_key_in_widget_constructors
  const TitleText(this.text, {this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color ?? Constants.textColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 22,
        ));
  }
}
