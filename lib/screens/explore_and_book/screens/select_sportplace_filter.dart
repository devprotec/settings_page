import 'package:flutter/cupertino.dart';

import 'package:settings_page/screens/events/choose_organizer.dart';
import 'package:settings_page/screens/explore_and_book/models/coach_filter_controller.dart';
import 'package:settings_page/screens/explore_and_book/screens/add_your_location.dart';
import 'package:settings_page/screens/explore_and_book/screens/search_sport_place.dart';

import '../../../util/exports.dart';

class SelectSportPlaceFilter extends StatefulWidget {
  const SelectSportPlaceFilter({Key? key}) : super(key: key);

  @override
  State<SelectSportPlaceFilter> createState() => _SelectSportPlaceFilterState();
}

class _SelectSportPlaceFilterState extends State<SelectSportPlaceFilter> {
  var controller = Get.put(CoachFilterController());
  bool isAnyTime = true;
  bool isSpecifyHours = false;
  bool isOpenedNow = false;
  bool isAllRatings = true;
  bool is4Stars = false;
  int distance = 0;
  
  onAllTap() {
    setState(() {
      isAllRatings = true;
      is4Stars = false;
    });
  }

  on4PlusTap() {
    setState(() {
      is4Stars = true;
      isAllRatings = false;
    });
  }

  onOpenNowSelected() {
    setState(() {
      isOpenedNow = true;
      isAnyTime = false;
      isSpecifyHours = false;
    });
  }

  
  

  onAnyTimeSelected() {
    setState(() {
      isAnyTime = true;
      isSpecifyHours = false;
      isOpenedNow = false;
    });
  }

  onSpecifyHoursSelected() {
    setState(() {
      isSpecifyHours = true;
      isAnyTime = false;
      isOpenedNow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            appBarTitle: "Filter",
            hasActions: true,
            trailingWidget: Text(
              "lbl_reset".tr.toUpperCase(),
              style: Constants.fainted_logout,
            ),
            leadingWidget: GestureDetector(
              child: closeButton(),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText("Location".tr),
                Constants.spaceSmallColumn,
                GestureDetector(
                  onTap: () {
                    Get.to(AddYourLocation());
                  },
                  child: Obx(
                    () => containterAndRow(controller.userLocation.value == ''
                        ? 'Add your location'.tr
                        : controller.userLocation.value),
                  ),
                ),
                Constants.spaceMediumColumn,
                titleText("lbl_distance".tr),
                Constants.spaceSmallColumn,
                distanceWidget(),
                Constants.spaceMediumColumn,
                titleText("lbl_rating".tr),
                Constants.spaceSmallColumn,
                Row(
                  children: [
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isAllRatings,
                        text: "lbl_all".tr,
                        onTap: () {
                          onAllTap();
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    ProfessionalTypeContainer(
                        hasRow: true,
                        isSelected: is4Stars,
                        text: "4+".tr,
                        onTap: () {
                          on4PlusTap();
                        }),
                  ],
                ),
                Constants.spaceMediumColumn,
                titleText("Working Days".tr),
                Constants.spaceSmallColumn,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectDays("Monday"),
                    selectDays("Tuesday"),
                    selectDays("Wednesday"),
                    selectDays('Thursday'),
                    selectDays('Friday'),
                    selectDays('Saturday'),
                    selectDays('Sunday'),
                  ],
                ),
                Constants.spaceLargeColumn,
                titleText("Working Hours".tr),
                Constants.spaceSmallColumn,
                SizedBox(
                  height: 35,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    ProfessionalTypeContainer(
                      isSelected: isAnyTime,
                      text: 'Anytime'.tr,
                      onTap: onAnyTimeSelected,
                      hasRow: false,
                    ),
                    Constants.spaceMediumRow,
                    ProfessionalTypeContainer(
                      isSelected: isOpenedNow,
                      text: 'Opened Now'.tr,
                      onTap: onOpenNowSelected,
                      hasRow: false,
                    ),
                    Constants.spaceMediumRow,
                    ProfessionalTypeContainer(
                      isSelected: isSpecifyHours,
                      text: 'Specify the hours'.tr,
                      onTap: onSpecifyHoursSelected,
                      hasRow: false,
                    ),
                  ]),
                ),
                Constants.spaceMedium,
                isSpecifyHours
                    ? GestureDetector(
                        onTap: () {
                          Get.bottomSheet(timeRangePicker());
                        },
                        child: Obx(
                          () => containterAndRow(
                              controller.userLocation.value == ''
                                  ? '8 AM - 9 PM'.tr
                                  : controller.userLocation.value),
                        ),
                      )
                    : SizedBox.shrink(),
                Constants.spaceMedium,
                Button(
                    text: "lbl_apply".tr,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SearchSportPlaces(),
                        ),
                      );
                    }),
                Constants.spaceMediumColumn,
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectDays(String day) {
    return GestureDetector(
      onTap: () {
        if (controller.days.contains(day)) {
          controller.days.remove(day);
        } else {
          controller.days.add(day);
        }
      },
      child: Obx(
        () => (Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              day.substring(0, 1),
              style: Constants.normalTextStyle,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: controller.days.contains(day)
                ? Constants.deepPurple100
                : Constants.inactiveStatusColorGray,
          ),
        )),
      ),
    );
  }

  ProfessionalTypeContainer(
      {required bool isSelected,
      required String text,
      required Function() onTap,
      double? width,
      required bool hasRow}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? null,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Constants.deepPurple100
              : Constants.inactiveStatusColorGray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: hasRow
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    color: Constants.inactiveIconColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: isSelected
                        ? AppStyle.poppinsTextstyle(
                            14, FontWeight.w500, Constants.indigo700)
                        : AppStyle.poppinsTextstyle(
                            14, FontWeight.w500, Constants.bluegray504),
                  ),
                ],
              )
            : Text(
                text,
                style: isSelected
                    ? AppStyle.poppinsTextstyle(
                        14,
                        FontWeight.w500,
                        Constants.indigo700,
                      )
                    : AppStyle.poppinsTextstyle(
                        14,
                        FontWeight.w500,
                        Constants.bluegray504,
                      ),
              ),
      ),
    );
  }

  titleText(String text) {
    return Text(
      text.tr,
      style: AppStyle.txtPoppinsMedium14,
    );
  }

  containterAndRow(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Constants.inactiveStatusColorGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(text,
                style: AppStyle.poppinsTextstyle(
                  15,
                  FontWeight.w400,
                  Constants.gray900,
                )),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Constants.inactiveIconColor,
            size: 16,
          ),
        ],
      ),
    );
  }

  distanceWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (distance > 0) {
                distance--;
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants.inactiveStatusColorGray,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: Text("-",
                style: AppStyle.poppinsTextstyle(
                  18,
                  FontWeight.w500,
                  distance == 0
                      ? Constants.bluegray200
                      : Constants.fromHex('#34405E'),
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.23, vertical: 12.5),
          decoration: BoxDecoration(
              color: Constants.inactiveStatusColorGray,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            "+" + distance.toString() + " km",
            style: AppStyle.poppinsTextstyle(
              16,
              FontWeight.w500,
              Constants.fromHex('#34405E'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              distance++;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: Text("+",
                style: AppStyle.poppinsTextstyle(
                  18,
                  FontWeight.w500,
                  Constants.fromHex('#34405E'),
                )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants.inactiveStatusColorGray,
            ),
          ),
        ),
      ],
    );
  }

  timeText(String time) {
    return Text(
      time.tr,
      style: AppStyle.txtPoppinsMedium14,
    );
  }

  timeRangePicker() {
    return Container(
      height: size.height * 0.45,
      width: double.infinity,
      color: Colors.white,
      child: CupertinoPicker(
        //diameterRatio: 0.5,
        itemExtent: 40,

        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          capEndEdge: false,
          capStartEdge: false,
        ),
        onSelectedItemChanged: (val) {},
        children: [
          timeText('12 PM - 1 AM'),
          timeText('1 AM - 2 AM'),
          timeText('2 AM - 3 AM'),
          timeText('3 AM - 4 AM'),
          timeText('4 AM - 5 AM'),
          timeText('5 AM - 6 AM'),
          timeText('6 AM - 7 AM'),
          timeText('7 AM - 8 AM'),
          timeText('8 AM - 9 AM'),
          timeText('8 AM - 10 AM'),
          timeText('10 AM - 11 AM'),
          timeText('11 AM - 12 PM'),
          timeText('12 PM - 1 PM'),
          timeText('1 PM - 2 PM'),
          timeText('2 PM - 3 PM'),
          timeText('3 PM - 4 PM'),
          timeText('4 PM - 5 PM'),
        ],
      ),
    );
  }
}
