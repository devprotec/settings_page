import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:settings_page/models/chat_model.dart';
import 'package:settings_page/screens/user_profile/add_momo_screen.dart';
import 'package:settings_page/screens/user_profile/billing_details_screen.dart';
import 'package:settings_page/util/exports.dart';
import 'package:settings_page/widgets/chat_item_layout.dart';
import 'package:settings_page/widgets/message_item_view.dart';

class ConversationViewScreen extends StatefulWidget {
  @override
  State<ConversationViewScreen> createState() => _ConversationViewScreenState();
}

class _ConversationViewScreenState extends State<ConversationViewScreen> {
  dynamic argumentsFromPreviousScreen = Get.arguments;

  List messagesList = [
    {
      "message": "Hello! I was busy at work.",
      "messageType": "sent",
      "date": "6/10/2022"
    },
    {
      "message":
          "Hello! I was busy at work. I have some availability at the end of June. I hope to see you then!",
      "messageType": "received",
      "date": "6/10/2022"
    },
    {
      "message": "I hope to see you then!",
      "messageType": "sent",
      "date": "6/10/2022"
    },
    {
      "message": "I have some availability at the end of June.",
      "messageType": "sent",
      "date": "7/10/2022"
    },
    {
      "message": "Hello! I was busy at work. Nice to meet you.",
      "messageType": "sent",
      "date": "7/10/2022"
    },
    {"message": "Hello!", "messageType": "received", "date": "8/10/2022"},
    {
      "message": "Hello! I was busy at work. Nice to meet you.",
      "messageType": "received",
      "date": "8/10/2022"
    },
    {
      "message":
          "Hello! I was busy at work. Nice to meet you. I know my schedule is pretty full, I’m sorry. I have some availability at the end of June. I hope to see you then!",
      "messageType": "sent",
      "date": "8/10/2022"
    },
    {
      "message":
          "Hello! I was busy at work. Nice to meet you. I know my schedule is pretty full, I’m sorry. I have some availability at the end of June. I hope to see you then!",
      "messageType": "received",
      "date": "8/10/2022"
    },
    {
      "message": "Hello! I was busy at work.",
      "messageType": "received",
      "date": "9/10/2022"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            flexibleSpace: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Row(
                              children: [
                                Constants.arrowBacks(
                                  color: Constants.inactiveIconColor,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: Hero(
                                    tag: argumentsFromPreviousScreen[0] +
                                        argumentsFromPreviousScreen[2]
                                            .toString(),
                                    child: CircleAvatar(
                                      child: Image.asset(
                                        argumentsFromPreviousScreen[1],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: argumentsFromPreviousScreen[2]
                                              .toString() +
                                          argumentsFromPreviousScreen[0],
                                      child: Text(
                                        argumentsFromPreviousScreen[0],
                                        style: AppStyle.poppinsTextstyle(
                                          14,
                                          FontWeight.w500,
                                          Constants.gray900,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Last seen 13 min ago",
                                      style: AppStyle.poppinsTextstyle(
                                        12,
                                        FontWeight.w400,
                                        Constants.inactiveIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              bottomSheet(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: Constants.inactiveIconColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
        backgroundColor: Constants.chatPageColor,
        body: Column(
          children: [
            Expanded(
              child: GroupedListView<dynamic, String>(
                elements: messagesList,
                groupBy: (element) => element["date"],
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1['message'].compareTo(item2['message']),
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                //floatingHeader: true,
                stickyHeaderBackgroundColor: Colors.transparent,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Flexible(
                    child: Container(
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Constants.conversationDateColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (c, element) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0,
                      left: element["messageType"] == "sent" ? 65 : 18,
                      right: element["messageType"] == "sent" ? 18 : 50,
                    ),
                    child: MessageItemView(
                      message: element["message"],
                      messageType: element["messageType"],
                      imageLocation: argumentsFromPreviousScreen[1],
                    ),
                  );
                },
              ),
            ),
            bottomTextField(),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> bottomSheet(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text(
              "lbl_view_profile".tr,
              style: AppStyle.poppinsTextstyle(
                16,
                FontWeight.w400,
                Constants.fromHex("#007AFF"),
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text(
              "lbl_block_coach".tr,
              style: AppStyle.poppinsTextstyle(
                16,
                FontWeight.w400,
                Constants.red500,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {},
            child: Text(
              "lbl_report".tr,
              style: AppStyle.poppinsTextstyle(
                16,
                FontWeight.w400,
                Constants.red500,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {},
            child: Text(
              "lbl_delete_chat".tr,
              style: AppStyle.poppinsTextstyle(
                16,
                FontWeight.w400,
                Constants.red500,
              ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Get.close(1);
          },
          isDestructiveAction: true,
          child: Text(
            'Cancel'.tr,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Constants.fromHex("#007AFF"),
              letterSpacing: 0.38,
            ),
          ),
        ),
      );
    },
  );
}

class bottomTextField extends StatefulWidget {
  @override
  State<bottomTextField> createState() => _bottomTextFieldState();
}

class _bottomTextFieldState extends State<bottomTextField> {
  bool enabled = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      height: height * 0.114,
      width: width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            CommonImageView(
              svgPath: "assets/images/icon_attach_image.svg",
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        enabled = true;
                      });
                    },
                    child: FocusScope(
                      child: Focus(
                        onFocusChange: (focus) {
                          enabled = focus;
                        },
                        child: TextFieldTemplate(
                          controller: controller,
                          height: 40.0,
                          hintText: '',
                          obscureText: false,
                          textInputAction: TextInputAction.send,
                          textInputType: TextInputType.multiline,
                          leftContentPadding: 16,
                          rightContentPadding: 50,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 18,
                    child: GestureDetector(
                      onTap: () {},
                      child: CommonImageView(
                        svgPath: "assets/images/img_send.svg",
                        color: enabled
                            ? Constants.lightBlue500
                            : Constants.bluegray200,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
