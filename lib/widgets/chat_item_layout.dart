import 'package:mhc_customer/util/exports.dart';

class ChatItemLayout extends StatelessWidget {
  final String messagePreview;
  final String date;
  final String senderName;
  final String senderImageLocation;
  int numberOfUnreadMessages;
  final String heroTag;
  final String heroTag2;

  ChatItemLayout({
    Key? key,
    required this.messagePreview,
    required this.date,
    required this.senderName,
    required this.senderImageLocation,
    required this.numberOfUnreadMessages,
    required this.heroTag,
    required this.heroTag2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                width: 56,
                height: 56,
                child: Hero(
                  tag: heroTag,
                  child: CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.black12,
                      backgroundImage: AssetImage(senderImageLocation)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: heroTag2,
                          child: Text(
                            senderName,
                            style: AppStyle.poppinsTextstyle(
                              14,
                              FontWeight.w500,
                              Constants.gray900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          messagePreview,
                          style: AppStyle.poppinsTextstyle(
                            12,
                            FontWeight.w400,
                            Constants.inactiveIconColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            date,
                            style: AppStyle.poppinsTextstyle(
                              14,
                              FontWeight.w400,
                              Constants.inactiveIconColor,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          numberOfUnreadMessages > 0
                              ? Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Constants.red500,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      numberOfUnreadMessages.toString(),
                                      style: AppStyle.poppinsTextstyle(
                                        12,
                                        FontWeight.w500,
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
