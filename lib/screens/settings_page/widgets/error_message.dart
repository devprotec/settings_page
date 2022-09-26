import 'package:settings_page/util/exports.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final Color? messageBackgroundColor;
  final IconData? infoIcon;
  final Color? messageColor;
  const ErrorMessage(
      {Key? key,
      required this.message,
      this.infoIcon,
       this.messageBackgroundColor,
      
       this.messageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: messageBackgroundColor ?? Color(0xffFFF2F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          
          infoIcon ?? Icons.info,
          color: messageColor ?? Color(0xffE74C3C),
          size:18,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            message,
            style: TextStyle(
              color: messageColor ?? Color(0xffE74C3C),
            ),
          ),
        ),
      ]),
    );
  }
}
