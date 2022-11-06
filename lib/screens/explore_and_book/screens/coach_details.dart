import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:settings_page/models/professional_data_model.dart';
import 'package:settings_page/screens/chat/chat_home_screen.dart';
import 'package:settings_page/screens/explore_and_book/widgets/pagination.dart';
import 'package:settings_page/screens/explore_and_book/widgets/sport_place.dart';
import 'package:settings_page/util/exports.dart';

import '../../../widgets/programs_card.dart';
import '../../explorer_booker/client_review_screen.dart';

class CoachDetails extends StatefulWidget {
  final ProfesionalDataModel coach;
  const CoachDetails({Key? key, required this.coach}) : super(key: key);

  @override
  State<CoachDetails> createState() => _CoachDetailsState();
}

class _CoachDetailsState extends State<CoachDetails> {
  int newArticlesCurrent = 0;

  final times = <String>[
    "12.00",
    "13:00",
    "13:30",
    "14:00",
    "15:00",
    "16:00",
    "17:00"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.55),
          child: Container(
            height: size.height * 0.55,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: size.height * 0.33,
                    padEnds: false,
                    disableCenter: true,
                    viewportFraction: 1,
                    initialPage: 0,
                    //enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        newArticlesCurrent = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    CommonImageView(
                      imagePath: "assets/images/img_coach_profile.jpg",
                    ),
                    CommonImageView(
                      imagePath: "assets/images/img_coach_profile.jpg",
                    ),
                    CommonImageView(
                      imagePath: "assets/images/img_coach_profile.jpg",
                    ),
                  ],
                ),
                Positioned.fill(
                  top: size.height * 0.31,
                  left: 16,
                  right: 16,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      width: size.width * 0.7,
                      decoration: AppDecoration.outlineLightblue90019.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.coach.Name!,
                                style: Constants.titleTextStyle,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Constants.pColor,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(widget.coach.rating.toString()),
                              SizedBox(width: 5),
                              Text(
                                widget.coach.numberOfReviews.toString(),
                                style: Constants.inactiveSubtitleTextStyle,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 15,
                                width: 1,
                                color: Colors.black12,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.workspace_premium,
                                color: Constants.fromHex('#24AE5F'),
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Certified".tr,
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Constants.fromHex('#24AE5F'),
                                ),
                              )
                            ],
                          ),
                          Constants.spaceMediumColumn,
                          Expanded(
                            child: GridView.builder(
                                itemCount: widget.coach.certificates!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: size.height * 0.01,
                                  mainAxisExtent: 30,
                                  crossAxisSpacing: size.width * 0.01,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Constants.fromHex('#F4F5FB'),
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.black12)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Center(
                                        child: Text(
                                            widget.coach.certificates![index])),
                                  );
                                }),
                          ),
                        ],
                      )),
                ),
                Positioned.fill(
                  top: size.height * 0.04,
                  left: 16,
                  child: Pagination(
                    itemsLength: 3,
                    current: newArticlesCurrent,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                  ),
                ),
                Positioned.fill(
                  bottom: size.height * 0.45,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          Get.back();
                        }),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.spaceMediumColumn,
                Text(
                  "About Coach".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
                Constants.spaceSmallColumn,
                Text(
                  'about_coach'.tr,
                  style: AppStyle.poppinsTextstyle(
                    14,
                    FontWeight.w400,
                    Constants.lightgray900,
                  ),
                ),
                Constants.spaceMediumColumn,
                Text(
                  "Certificates".tr,
                  style: Constants.normalTextStyle,
                ),
                Constants.spaceSmallColumn,
                SizedBox(
                  height: 100,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.coach.certificates!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: size.height * 0.01,
                        mainAxisExtent: 30,
                        crossAxisSpacing: size.width * 0.01,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Center(
                              child: Text(widget.coach.certificates![index])),
                        );
                      }),
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
                Constants.spaceMediumColumn,
                Text(
                  "Workout Locations".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
                Constants.spaceSmallColumn,
                Container(
                  width: double.infinity,
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SportPlace(
                          width: size.width * 0.85,
                        ),
                      );
                    },
                  ),
                ),
                Constants.spaceMediumColumn,
                Container(
                  width: Get.width,
                  height: 1,
                  color: Constants.indigo50,
                ),
                Constants.spaceMediumColumn,
                Text(
                  "Today, ".tr +
                      DateTime.now().day.toString() +
                      " " +
                      DateTime.now().month.toString(),
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on),
                    Expanded(
                        child: Text(
                            'Halo Salt Gym, 6391 Elgin St. Celina, Dela..')),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.black12,
                    ),
                    Text('15Kg')
                  ],
                ),
                Constants.spaceMediumColumn,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: AppDecoration.outlineLightblue90019.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  height: 130,
                  width: size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            itemCount: 7,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: size.height * 0.01,
                              mainAxisExtent: 30,
                              crossAxisSpacing: size.width * 0.01,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black12)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Center(child: Text(times[index])),
                              );
                            }),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_drop_down, size: 40),
                      ),
                    ],
                  ),
                ),
                Constants.spaceMediumColumn,
                Center(
                  child: Text(
                    'Check Availability'.tr,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Constants.fromHex('#00ACE9'),
                    ),
                  ),
                ),
                Constants.spaceMediumColumn,
                Text(
                  "Programs".tr,
                  style: AppStyle.poppinsTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Constants.bluegray900,
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProgramCard(
                          width: size.width * 0.9,
                          eventDataModel: programs[index],
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
                Column(
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
              ],
            ),
          ),
        ),
        floatingActionButton:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(()=>ChatHomeScreen());
              },
              child: Container(
                height: 48,
                margin: EdgeInsets.only(left: 32),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: BoxDecoration(
                color: Constants.fromHex('#CDF1FF'),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.chat,
                size: 22,
                color: Constants.fromHex('#0064A7'),
              ),
                      ),
            ),
            Button(text: "Book", onPressed: (){}, width: size.width*0.7,),
          ],
        )
      ),
    );
  }
}
