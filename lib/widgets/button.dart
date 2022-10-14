import '../util/exports.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonElevation;
  final double? height;
  final Widget? icon;
  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.height,
    this.buttonElevation,
    this.icon,
  }) : super(key: key);

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

            // height: height ?? null,
            //  margin: const EdgeInsets.symmetric(vertical: 10),
            //padding: const EdgeInsets.symmetric(vertical: 20),

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
              child: icon == null
                  ? Text(
                      text.toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? Colors.white,
                        fontSize: 14,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        const SizedBox(width: 10),
                        Text(
                          text.toUpperCase(),
                          style: TextStyle(
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                            color: textColor ?? Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ));
  }
}

class ButtonIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const ButtonIcon({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        margin: const EdgeInsets.all(10),
        child: PhysicalModel(
          color: const Color(0xFF0095E9),
          shadowColor: const Color(0xFF0095E9),
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 48,

            //  margin: const EdgeInsets.symmetric(vertical: 10),
            //padding: const EdgeInsets.symmetric(vertical: 20),

            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0XFFE6E8F3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 0), // changes position of shadow
                ),
                // BoxShadow(
                //   color: Color(0XFFE6E8F3),
                //   spreadRadius: 0.01,
                //   blurRadius: 1,
                //   offset: Offset(-0, -0), // changes position of shadow
                // ),
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00ACE9),
                  Color(0xFF0095E9),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  text.toUpperCase(),
                  style: const TextStyle(
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double? width;
  const CustomButton(
      {required this.text,
      required this.textColor,
      required this.backgroundColor,
      this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 48,
      width: width ?? 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyle.poppinsTextstyle(15, FontWeight.w500, textColor),
        ),
      ),
    );
  }
}
