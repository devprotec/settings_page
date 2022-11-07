// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mhc_customer/util/exports.dart';

class MessageItemView extends StatelessWidget {
  String message;
  String messageType;
  String imageLocation;

  MessageItemView({
    Key? key,
    required this.message,
    required this.messageType,
    required this.imageLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Expanded(
        child: Row(
          mainAxisAlignment: messageType == "sent"
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: messageType == "sent" ? 0 : 32,
              width: messageType == "sent" ? 0 : 32,
              child: CircleAvatar(
                child: Image.asset(imageLocation),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: messageType == "sent"
                        ? Radius.circular(0)
                        : Radius.circular(16),
                    bottomLeft: messageType == "sent"
                        ? Radius.circular(16)
                        : Radius.circular(0),
                  ),
                  color: messageType == "sent"
                      ? Constants.sentMessageBoxColor
                      : Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    message,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Constants.fromHex("#34405E"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
