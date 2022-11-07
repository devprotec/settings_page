import 'package:settings_page/util/exports.dart';

class PreviewProgramScreen extends StatefulWidget {
  @override
  State<PreviewProgramScreen> createState() => _PreviewProgramScreenState();
}

class _PreviewProgramScreenState extends State<PreviewProgramScreen> {
  int currentTab = 0;
  List programDetailsScreens = ["Overview", "Activities"];

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Overview'),
    const Tab(text: 'Activities'),
  ];

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    String programType = "in person";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.686),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height * 0.4467,
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: FittedBox(
                  fit: BoxFit.fill,
                  child: CommonImageView(
                    imagePath: "assets/images/img_coach_profile.jpg",
                  ),
                ),
                child: CommonImageView(
                  svgPath: "assets/images/img_background_appbar.svg",
                ),
              ),
            ),
            Positioned(
              top: height * 0.0389,
              child: Container(
                width: width,
                child: AppbarWidget(
                  itemsColor: Colors.white,
                  hasActions: true,
                  appBarTitle: "Preview Program",
                  trailingWidget: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.2658,
                left: width * 0.0533,
                right: width * 0.0533,
              ),
              child: Container(
                width: width,
                decoration: AppDecoration.outlineLightblue90019.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Constants.fromHex("#CDF1FF")),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              child: Text(
                                "Program",
                                style: AppStyle.poppinsTextstyle(
                                  12.0,
                                  FontWeight.w500,
                                  Constants.fromHex("#0085C8"),
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Constants.lightgray900,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Healthy Eating Meetup',
                        style: AppStyle.poppinsTextstyle(
                          18,
                          FontWeight.w600,
                          Constants.gray900,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '21 Nov, 2021 - 21 Nov, 2021',
                        style: AppStyle.poppinsTextstyle(
                          14,
                          FontWeight.w400,
                          Constants.lightgray900,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Mon, Wed, Fri ',
                        style: AppStyle.poppinsTextstyle(
                          12,
                          FontWeight.w400,
                          Constants.lightgray900,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 1,
                        width: width,
                        color: Constants.horizontalLineColor,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              child: Image.asset(
                                "assets/images/img_unsplashkvmirq_32X32.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Jacob Cooper',
                            style: AppStyle.poppinsTextstyle(
                              12,
                              FontWeight.w400,
                              Constants.lightgray900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      programTypeInfoDisplay(programType),
                      SizedBox(
                        height: 16,
                      ),
                      Button(
                        text: "BOOK A PROGRAM",
                        onPressed: () {
                          Get.to(() => CardAddingScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTabs(
                  tabs: tabs,
                  switchTab: (index) {
                    setState(() {
                      currentTab = index;
                    });
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "lbl_organiser_sing".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.gray900,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          child: CircleAvatar(
                            child: Image.asset(
                              "assets/images/img_unsplashkvmirq_32X32.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jacob Cooper',
                              style: AppStyle.poppinsTextstyle(
                                14,
                                FontWeight.w500,
                                Constants.gray900,
                              ),
                            ),
                            Text(
                              'Fitness coach',
                              style: AppStyle.poppinsTextstyle(
                                12,
                                FontWeight.w400,
                                Constants.inactiveIconColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ratingRowView(),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Constants.bluegray200,
                        ),
                        SizedBox(
                          width: width * 0.053,
                        ),
                        CommonImageView(
                          svgPath: "assets/images/icon_chat_button.svg",
                          color: Constants.lightBlue500,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Container(
                  height: 1,
                  width: width,
                  color: Constants.horizontalLineColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "msg_general_informa".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.gray900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Container(
                    width: width,
                    height: 1,
                    color: Constants.indigo50,
                  ),
                ),
                Text(
                  "lbl_location".tr,
                  style: AppStyle.poppinsTextstyle(
                    18,
                    FontWeight.w600,
                    Constants.bluegray900,
                  ),
                ),
                locationDetailsToDisplay(programType),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Container(
                    width: width,
                    height: 1,
                    color: Constants.indigo50,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "lbl_client_reviews".tr,
                      style: AppStyle.poppinsTextstyle(
                        18,
                        FontWeight.w600,
                        Constants.bluegray900,
                      ),
                    ),
                    Text(
                      "lbl_see_all".tr.toUpperCase(),
                      style: AppStyle.poppinsTextstyle(
                        14,
                        FontWeight.w600,
                        Constants.successPasswordColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: RatingBar.builder(
                        itemSize: 15,
                        initialRating: 5.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Container(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: Icon(
                              Icons.star,
                              color: Constants.lightBlue500,
                            ),
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '5.0',
                      style: AppStyle.poppinsTextstyle(
                        16,
                        FontWeight.w600,
                        Constants.lightgray900,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 24.0,
                        width: 1,
                        color: Constants.indigo50,
                      ),
                    ),
                    Text(
                      '143 reviews',
                      style: AppStyle.poppinsTextstyle(
                        16,
                        FontWeight.w500,
                        Constants.bluegray504,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tsan S.',
                  style: AppStyle.poppinsTextstyle(
                    16,
                    FontWeight.w500,
                    Constants.gray900,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: RatingBar.builder(
                        itemSize: 12,
                        initialRating: 5.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Container(
                          child: Center(
                            child: Icon(
                              Icons.star,
                              color: Constants.lightBlue500,
                            ),
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '5.0',
                      style: AppStyle.poppinsTextstyle(
                        12,
                        FontWeight.w500,
                        Constants.lightgray900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '3 Elements  - Adult Class',
                  style: AppStyle.poppinsTextstyle(
                    14,
                    FontWeight.w500,
                    Constants.gray900,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Constants.fromHex("#EFDAF7")),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Text(
                      "Class",
                      style: AppStyle.poppinsTextstyle(
                        12.0,
                        FontWeight.w500,
                        Constants.fromHex("#8E44AD"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Hannah is very positive, friendly, and effective as a customer. We developed a workout plan together to reach towards my goals. He is also eager to answer questions that I had about nutrition and workout trends. Jane finds a way to motivate and push you just the right amount, while not being overbearing. I am feeling great, more energetic, less stressed, and developing the physique that I want. Thank you Jane!',
                  style: AppStyle.poppinsTextstyle(
                    14,
                    FontWeight.w400,
                    Constants.lightgray900,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'March 8, 2021',
                  style: AppStyle.poppinsTextstyle(
                    12,
                    FontWeight.w400,
                    Constants.bluegray504,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget programTypeInfoDisplay(String programType) {
    if (programType == "hybrid") {
      return Row(
        children: [
          CommonImageView(
            svgPath: "assets/images/icon_vidcamera.svg",
          ),
          SizedBox(
            width: 10,
          ),
          CommonImageView(
            svgPath: "assets/images/icon_prog_loc.svg",
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Hybrid',
            style: AppStyle.poppinsTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Constants.lightgray900,
            ),
          ),
        ],
      );
    } else if (programType == "online") {
      return Row(
        children: [
          CommonImageView(
            svgPath: "assets/images/icon_vidcamera.svg",
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Online',
            style: AppStyle.poppinsTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Constants.lightgray900,
            ),
          ),
        ],
      );
    } else if (programType == "in person") {
      return Row(
        children: [
          CommonImageView(
            svgPath: "assets/images/icon_prog_loc.svg",
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'In person',
            style: AppStyle.poppinsTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Constants.lightgray900,
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget locationDetailsToDisplay(String programType) {
    if (programType == "hybrid") {
      return Column(
        children: [
          onlineEventLocationView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Container(
              width: Get.width,
              height: 1,
              color: Constants.indigo50,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Hello");
              //Get.to(() => LocationDetailsScreen());
            },
            child: inPersonEventLocationView(),
          ),
        ],
      );
    } else if (programType == "online") {
      return onlineEventLocationView();
    } else if (programType == "in person") {
      return inPersonEventLocationView();
    }
    return SizedBox();
  }

  Widget onlineEventLocationView() {
    return Row(
      children: [
        CommonImageView(
          width: 36,
          height: 26,
          svgPath: "assets/images/icon_vidcamera.svg",
        ),
        SizedBox(
          width: 13,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_online".tr,
              style: AppStyle.poppinsTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Constants.textColorViolet,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "msg_organizer_will".tr,
              style: AppStyle.poppinsTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Constants.bluegray504,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget inPersonEventLocationView() {
    return GestureDetector(
      onTap: () {
        print("Hello");
        Get.to(() => LocationDetailsScreen());
      },
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.299,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(5.530173, -0.2713955),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => LocationDetailsScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CommonImageView(
                            imagePath: "assets/images/img_halo_logo.png",
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Halo Salt Gym",
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Constants.bluegray900,
                              ),
                            ),
                            ratingRowView()
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Constants.lightBlue500,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 12,
                      width: 1,
                      color: Constants.indigo50,
                    ),
                  ),
                  Text(
                    "1.5 km",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Constants.lightgray900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Opened.",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Closing at 11:00 PM",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Button(
                onPressed: () {},
                text: "lbl_directions".tr.toUpperCase(),
                buttonColor: Constants.lightBlue50,
                textColor: Constants.lightBlue700,
                icon: Icon(
                  Icons.directions,
                  color: Constants.lightBlue700,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "lbl_copy_address".tr.toUpperCase(),
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Constants.lightBlue700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget ratingRowView() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      IgnorePointer(
        ignoring: true,
        child: RatingBar.builder(
          itemSize: 12,
          initialRating: 5.0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Container(
            child: Center(
              child: Icon(
                Icons.star,
                color: Constants.lightBlue500,
              ),
            ),
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ),
      SizedBox(
        width: 6,
      ),
      Text(
        '5.0',
        style: AppStyle.poppinsTextstyle(
          12,
          FontWeight.w500,
          Constants.lightgray900,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          height: 12,
          width: 1,
          color: Constants.indigo50,
        ),
      ),
      Text(
        '13 reviews',
        style: AppStyle.poppinsTextstyle(
          12,
          FontWeight.w400,
          Constants.inactiveIconColor,
        ),
      ),
    ]);
  }
}
