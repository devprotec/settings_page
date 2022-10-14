import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:settings_page/util/exports.dart';

class CoachDetailsScreen extends StatelessWidget {
  List goals = [
    "Grow Fat",
    "Make Money",
    "Get Married",
    "Lose Weight",
    "Be More Active",
  ];

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.6196),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height * 0.41979,
              child: CommonImageView(
                imagePath: "assets/images/img_coach_profile.jpg",
              ),
            ),
            Positioned(
              top: height * 0.0389,
              child: AppbarWidget(
                itemsColor: Colors.white,
                hasActions: true,
                appBarTitle: "",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.2958,
                left: width * 0.0533,
                right: width * 0.0533,
                bottom: 20,
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hannah Burnell',
                            style: AppStyle.poppinsTextstyle(
                              24,
                              FontWeight.w600,
                              Constants.gray900,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Constants.lightgray900,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '08.10.1992',
                                  style: AppStyle.poppinsTextstyle(
                                    14,
                                    FontWeight.w400,
                                    Constants.lightgray900,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Container(
                                    width: 1,
                                    height: 16,
                                    color: Constants.horizontalLineColor,
                                  ),
                                ),
                                Text(
                                  'Female',
                                  style: AppStyle.poppinsTextstyle(
                                    14,
                                    FontWeight.w400,
                                    Constants.lightgray900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        height: 32,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: goals.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(goals[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Constants.chatPageColor),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        goals[index],
                                        style: AppStyle.poppinsTextstyle(
                                          14.0,
                                          FontWeight.w500,
                                          Constants.inactiveIconColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Button(
                        text: "CHAT WITH USER",
                        onPressed: () {},
                        icon: CommonImageView(
                          svgPath: "assets/images/icon_chat_button.svg",
                        ),
                        buttonColor: Constants.lightBlue50,
                        textColor: Constants.lightbuttonTextColor,
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.0533,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_health_details".tr,
                style: AppStyle.poppinsTextstyle(
                  18,
                  FontWeight.w600,
                  Constants.bluegray900,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Constants.healthDetailsBackground.withAlpha(120),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '60',
                                style: AppStyle.poppinsTextstyle(
                                  18,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'kg',
                                style: AppStyle.poppinsTextstyle(
                                  14,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Weight',
                            style: AppStyle.poppinsTextstyle(
                              12,
                              FontWeight.w400,
                              Constants.inactiveIconColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48.0,
                        width: 1,
                        color: Constants.lightBlue50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '160',
                                style: AppStyle.poppinsTextstyle(
                                  18,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'cm',
                                style: AppStyle.poppinsTextstyle(
                                  14,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Height',
                            style: AppStyle.poppinsTextstyle(
                              12,
                              FontWeight.w400,
                              Constants.inactiveIconColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48.0,
                        width: 1,
                        color: Constants.lightBlue50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'A',
                                style: AppStyle.poppinsTextstyle(
                                  18,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '+',
                                style: AppStyle.poppinsTextstyle(
                                  14,
                                  FontWeight.w400,
                                  Constants.lightbuttonTextColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Blood',
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
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "lbl_allergies".tr,
                style: AppStyle.poppinsTextstyle(
                  14,
                  FontWeight.w500,
                  Constants.bluegray900,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Cow milk, Shellfish",
                style: AppStyle.poppinsTextstyle(
                  12,
                  FontWeight.w400,
                  Constants.inactiveIconColor,
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
                "lbl_contact_info".tr,
                style: AppStyle.poppinsTextstyle(
                  18,
                  FontWeight.w600,
                  Constants.bluegray900,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  CommonImageView(
                    svgPath: "assets/images/icon_telephone_bt.svg",
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    '+1 201 809 45 67',
                    style: AppStyle.poppinsTextstyle(
                      14.0,
                      FontWeight.w500,
                      Constants.lightgray900,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  CommonImageView(
                    svgPath: "assets/images/icon_mail_bt.svg",
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    'johndoe@mail.com',
                    style: AppStyle.poppinsTextstyle(
                      14.0,
                      FontWeight.w500,
                      Constants.lightgray900,
                    ),
                  )
                ],
              ),
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
                    "lbl_coach_review".tr,
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
    );
  }
}
