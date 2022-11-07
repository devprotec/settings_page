import 'package:mhc_customer/util/exports.dart';

class ChatHomeScreen extends StatelessWidget {
  final List<Chat> chatList = [
    Chat(
        senderName: "Jane Cooper",
        messagePreview: "Hello",
        date: "Oct. 29",
        senderImageLocation: "assets/images/img_avatar_56X56.png",
        numberOfUnreadMessages: 10),
    Chat(
        senderName: "David Brewu",
        messagePreview:
            "Hello! I was busy at work. Nice to meet you. I know my schedule is...",
        date: "Oct. 29",
        senderImageLocation: "assets/images/img_avatar.png",
        numberOfUnreadMessages: 4),
    Chat(
        senderName: "Oswald Gyaba",
        messagePreview: "Hi, I am busy at the moment",
        date: "Oct. 29",
        senderImageLocation: "assets/images/img_avatar_1.png",
        numberOfUnreadMessages: 1),
    Chat(
      senderName: "Kwasi Tabury",
      messagePreview: "Nice to meet you.",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_2.png",
      numberOfUnreadMessages: 0,
    ),
    Chat(
      senderName: "Eugene Asiedu",
      messagePreview:
          "I have some availability at the end of June. I hope to see you...",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_3.png",
      numberOfUnreadMessages: 0,
    ),
    Chat(
      senderName: "Devon Lane",
      messagePreview:
          "Hi, it’s okay. Nice to meet you too. Will write you at July.",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_4.png",
      numberOfUnreadMessages: 2,
    ),
    Chat(
      senderName: "Baaman Suuk",
      messagePreview: "Last notification message",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_5.png",
      numberOfUnreadMessages: 0,
    ),
    Chat(
      senderName: "Oswald Gyaba",
      messagePreview: "Are you okay?",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_1.png",
      numberOfUnreadMessages: 0,
    ),
    Chat(
      senderName: "Kwasi Tabury",
      messagePreview: "Last notification message",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar_4.png",
      numberOfUnreadMessages: 0,
    ),
    Chat(
      senderName: "Flyod Miles",
      messagePreview: "No, I cannot make it today",
      date: "Oct. 29",
      senderImageLocation: "assets/images/img_avatar.png",
      numberOfUnreadMessages: 0,
    )
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          flexibleSpace: PreferredSize(
            child: AppbarWidget(
              hasActions: true,
              appBarTitle: "lbl_chat".tr,
            ),
            preferredSize: Size.fromHeight(50),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 85),
            height: height,
            child: ListView.separated(
              itemCount: 11,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationScreen());
                      },
                      child: ChatItemLayout(
                        date: 'Oct. 29',
                        messagePreview:
                            "Check your calender for the Yoga class",
                        senderImageLocation: "assets/images/icon_notify.png",
                        senderName: "Notifications",
                        numberOfUnreadMessages: 2,
                        heroTag: "Notifications" + index.toString(),
                        heroTag2: index.toString() + "Notifications",
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ConversationViewScreen(), arguments: [
                        chatList[index - 1].senderName,
                        chatList[index - 1].senderImageLocation,
                        index
                      ]);
                    },
                    child: ChatItemLayout(
                      date: chatList[index - 1].date,
                      heroTag:
                          chatList[index - 1].senderName + index.toString(),
                      heroTag2:
                          index.toString() + chatList[index - 1].senderName,
                      messagePreview: chatList[index - 1].messagePreview,
                      senderImageLocation:
                          chatList[index - 1].senderImageLocation,
                      senderName: chatList[index - 1].senderName,
                      numberOfUnreadMessages:
                          chatList[index - 1].numberOfUnreadMessages,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Constants.indigo50,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
