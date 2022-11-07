// ignore_for_file: must_be_immutable

import 'package:mhc_customer/util/exports.dart';

class LocationDetailsScreen extends StatelessWidget {
  var organizerList = <ProfesionalDataModel>[
    cooper,
    nancy,
    stefany,
    guy,
    amelia,
    david,
    anthony,
    oswald,
    simon,
    bright
  ];

  List<LocationActivites> activities = [
    LocationActivites(
      "Yoga",
      Constants.fromHex("#F4F5FB"),
      "assets/images/img_yoga.svg",
    ),
    LocationActivites(
      "Stretching",
      Constants.fromHex("#FFF2E7"),
      "assets/images/img_stretching.svg",
    ),
    LocationActivites(
      "Meditation",
      Constants.fromHex("#F8F3FA"),
      "assets/images/img_meditation.svg",
    ),
  ];

  List<LocationAvailability> availability = [
    LocationAvailability(
      "Sun",
      "10AM - 6PM",
    ),
    LocationAvailability(
      "Mon",
      "6AM - 10PM",
    ),
    LocationAvailability(
      "Tue",
      "6AM - 10PM",
    ),
    LocationAvailability(
      "Wed",
      "6AM - 10PM",
    ),
    LocationAvailability(
      "Thu",
      "6AM - 10PM",
    ),
    LocationAvailability(
      "Fri",
      "6AM - 10PM",
    ),
    LocationAvailability(
      "Sat",
      "10AM - 6PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.27),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height * 0.2308,
              child: CommonImageView(
                svgPath: "assets/images/img_event_loc_bac.svg",
              ),
            ),
            Positioned(
              top: height * 0.0389,
              child: Container(
                width: width,
                child: AppbarWidget(
                  itemsColor: Colors.black,
                  hasActions: true,
                  appBarTitle: " ",
                  trailingWidget: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 106),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        /* child: CommonImageView(
                          imagePath: "assets/images/img_halo_logo.png",
                        ), */
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HALO',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                letterSpacing: 3,
                              ),
                            ),
                            Positioned(
                              top: -30.0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Text(
                                'GYM',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
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
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Constants.gray900,
                            ),
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
                                  itemCount: 1,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
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
                                  14,
                                  FontWeight.w500,
                                  Constants.lightgray900,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '1224',
                                style: AppStyle.poppinsTextstyle(
                                  14,
                                  FontWeight.w400,
                                  Constants.inactiveIconColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "6391 Elgin St. Celina, Delaware 10299",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Constants.lightgray900,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 12,
                              width: 2,
                              color: Constants.lightgray900,
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
                      )
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
                          color: Constants.lightgray900,
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
                          color: Constants.lightgray900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'what_to_expect'.tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'what_to_expect_long'.tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.lightgray900,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.phone,
                        color: Constants.lightgray900,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      '+1 201 809 45 67',
                      style: AppStyle.poppinsTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Constants.lightgray900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "lbl_activity".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
              ),
              Container(
                width: width,
                height: 110,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 12),
                      child: Container(
                        width: 112,
                        height: 110,
                        decoration: BoxDecoration(
                          color: activities[index].activityColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonImageView(
                              width: 70,
                              height: 54,
                              svgPath: activities[index].activityImage,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              activities[index].activityName,
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Constants.bluegray900,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  "Coaches".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 24, top: 16, bottom: 5),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: organizerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: NewProfessionalCard(
                        width: size.width * 0.95,
                        profesionalDataModel: organizerList[index],
                        isCard: true,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  "Programs".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
              ),
              SizedBox(
                height: 245,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 24, top: 16, bottom: 5),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ProgramCard(
                          width: size.width * 0.9,
                          eventDataModel: programs[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'general_availability'.tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: availability.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: height * 0.02,
                    mainAxisExtent: 57,
                    crossAxisSpacing: width * 0.0933,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          availability[index].day,
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Constants.lightgray900,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          availability[index].time,
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constants.lightgray900,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        GestureDetector(
                          onTap: () => Get.to(() => ClientReviewScreen()),
                          child: Text(
                            "lbl_see_all".tr.toUpperCase(),
                            style: AppStyle.poppinsTextstyle(
                              14,
                              FontWeight.w600,
                              Constants.successPasswordColor,
                            ),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
