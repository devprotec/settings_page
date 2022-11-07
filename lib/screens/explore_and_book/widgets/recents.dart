import 'package:settings_page/util/exports.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  ValueNotifier<String> keyword = ValueNotifier('');
  String selectedKeyword = 'recent';
  var seachItem = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputForms(
                    icon: Icons.arrow_back,
                    placeholder: "Search...",
                    notifier: keyword,
                    obscure: false,
                    onChange: (val) {
                      keyword.value = val!;
                    }),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: recentItems.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              selectedKeyword = recentItems[index];
                              //seachItem =
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 16,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: selectedKeyword == recentItems[index]
                                ? Constants.deepPurple100
                                : Constants.inactiveStatusColorGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              recentItems[index].tr,
                              style: selectedKeyword == recentItems[index]
                                  ? AppStyle.poppinsTextstyle(
                                      14, FontWeight.w500, Constants.indigo700)
                                  : AppStyle.poppinsTextstyle(14,
                                      FontWeight.w500, Constants.bluegray504),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < recent.length; i++)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Search(
                            searchWord: recent[i].tr,
                          ));
                    },
                    child: Container(
                      height: 57,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Constants.lightBlue90019,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            recent[i],
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Constants.fromHex(
                                '#0E1339',
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
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

final recentItems = [
  "recent",
  "trending",
  "activities",
  "coaches",
  "New",
  "Yoga",
  "Fitness",
  "MHC"
];
final recent = ["Yoga", 'Core', 'Walk', 'Meditation'];
final trending = ["Coaches", 'Fitness', 'MHC', 'activities'];
