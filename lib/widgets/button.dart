import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonElevation;
  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.buttonColor,
      this.textColor,
      this.buttonElevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: PhysicalModel(
          color: buttonColor ?? const Color(0xFF0095E9),
          shadowColor: buttonColor ?? const Color(0xFF0095E9),
          elevation: buttonElevation ?? 5,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 48.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  buttonColor ?? Color(0xFF00ACE9),
                  buttonColor ?? Color(0xFF0095E9),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ));
  }
}
