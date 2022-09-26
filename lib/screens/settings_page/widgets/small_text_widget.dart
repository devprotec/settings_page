import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? textColor;
  final FontWeight? weight;
  // ignore: use_key_in_widget_constructors
  const SmallText(
    this.text, {
    this.size,
    this.textColor,
        this.weight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? const Color(0xff6E768D),
        fontSize: size ?? 12,
        fontWeight: weight?? FontWeight.normal
      ),
    );
  }
}
