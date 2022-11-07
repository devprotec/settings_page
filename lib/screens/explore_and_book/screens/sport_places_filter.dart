import 'package:flutter/cupertino.dart';

import '../../../util/exports.dart';

class SportPlacesFilter extends StatefulWidget {
  const SportPlacesFilter({Key? key}) : super(key: key);

  @override
  State<SportPlacesFilter> createState() => _SportPlacesFilterState();
}

class _SportPlacesFilterState extends State<SportPlacesFilter> {
  var controller = Get.put(CoachFilterController());
  bool isIndividual = true;
  bool isGroup = false;
  bool isWorkingHours = true;
  bool isSpecifyHours = false;
  bool is247 = false;
  String selectedWorkOut = "";
  //List<String> selectedActivities = [];

  onIndividualSelected() {
    setState(() {
      isIndividual = true;
      isGroup = false;
    });
  }

  onGroupSelected() {
    setState(() {
      isGroup = true;
      isIndividual = false;
    });
  }

  on247Tap() {
    setState(() {
      is247 = true;
      isWorkingHours = false;
      isSpecifyHours = false;
    });
  }

  onWorkingHoursSelected() {
    setState(() {
      isWorkingHours = true;
      isSpecifyHours = false;
      is247 = false;
    });
  }

  onSpecifyHoursSelected() {
    setState(() {
      isSpecifyHours = true;
      isWorkingHours = false;
      is247 = false;
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.spaceMediumColumn,
                text("Workout Type".tr),
                Constants.spaceMediumColumn,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfessionalTypeContainer(
                      hasRow: false,
                      isSelected: selectedWorkOut == "All",
                      onTap: () {
                        setState(() {
                          selectedWorkOut = "All";
                        });
                      },
                      text: 'All',
                    ),
                    ProfessionalTypeContainer(
                      hasRow: false,
                      isSelected: selectedWorkOut == "Programs" ||
                          selectedWorkOut == "All",
                      onTap: () {
                        setState(() {
                          selectedWorkOut = "Programs";
                        });
                      },
                      text: 'Programs',
                    ),
                    ProfessionalTypeContainer(
                      hasRow: false,
                      isSelected: selectedWorkOut == "Classes" ||
                          selectedWorkOut == "All",
                      onTap: () {
                        setState(() {
                          selectedWorkOut = "Classes";
                        });
                      },
                      text: 'Classes',
                    ),
                    ProfessionalTypeContainer(
                      hasRow: false,
                      isSelected: selectedWorkOut == "Events" ||
                          selectedWorkOut == "All",
                      onTap: () {
                        setState(() {
                          selectedWorkOut = "Events";
                        });
                      },
                      text: 'Events',
                    ),
                  ],
                ),
                Constants.spaceSmallColumn,
                ProfessionalTypeContainer(
                  hasRow: false,
                  isSelected:
                      selectedWorkOut == "Bootcamp" || selectedWorkOut == "All",
                  onTap: () {
                    setState(() {
                      selectedWorkOut = "Bootcamp";
                    });
                  },
                  text: 'Bootcamp',
                ),
                Constants.spaceMediumColumn,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Activity'),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => SelectActivity(
                            explore: Explore.None,
                            buttonText: "lbl_save".tr,
                            isOnline: false,
                          ),
                        );
                      },
                      child: Text(
                        "See All",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Constants.fromHex('#0095E9'),
                        ),
                      ),
                    ),
                  ],
                ),
                Constants.spaceMediumColumn,
                Row(
                  children: [
                    ProfessionalTypeContainer(
                      hasRow: false,
                      isSelected: controller.activities.contains("All"),
                      onTap: () {
                        setState(() {
                          controller.activities.value = [
                            "All",
                            "Cardio",
                            "Fitness",
                            "Meditation",
                            "Yoga",
                            "Running",
                            "Stretching"
                          ];
                        });
                      },
                      text: 'All',
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected:
                            controller.activities.contains("Meditation"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Meditation")) {
                              controller.activities.remove("Meditation");
                            } else {
                              controller.activities.add("Meditation");
                            }
                          });
                        },
                        text: 'Meditation',
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: controller.activities.contains("Yoga"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Yoga")) {
                              controller.activities.remove("Yoga");
                            } else {
                              controller.activities.add("Yoga");
                            }
                          });
                        },
                        text: 'Yoga',
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: controller.activities.contains("Fitness"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Fitness")) {
                              controller.activities.remove("Fitness");
                            } else {
                              controller.activities.add("Fitness");
                            }
                          });
                        },
                        text: 'Fitness',
                      ),
                    ),
                  ],
                ),
                Constants.spaceSmallColumn,
                Row(
                  children: [
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected:
                            controller.activities.contains("Stretching"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Stretching")) {
                              controller.activities.remove("Stretching");
                            } else {
                              controller.activities.add("Stretching");
                            }
                          });
                        },
                        text: 'Stretching',
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: controller.activities.contains("Running"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Running")) {
                              controller.activities.remove("Running");
                            } else {
                              controller.activities.add("Running");
                            }
                          });
                        },
                        text: 'Running',
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: controller.activities.contains("Cardio"),
                        onTap: () {
                          setState(() {
                            controller.activities.remove("All");
                            if (controller.activities.contains("Cardio")) {
                              controller.activities.remove("Cardio");
                            } else {
                              controller.activities.add("Cardio");
                            }
                          });
                        },
                        text: 'Cardio',
                      ),
                    ),
                  ],
                ),
                Constants.spaceMediumColumn,
                titleText("Rate Range".tr),
                Constants.spaceSmallColumn,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfessionalTypeContainer(
                        isSelected: isIndividual,
                        text: 'Individual'.tr,
                        onTap: onIndividualSelected,
                        hasRow: false,
                        width: size.width * 0.43,
                      ),
                      ProfessionalTypeContainer(
                        isSelected: isGroup,
                        text: 'Group'.tr,
                        onTap: onGroupSelected,
                        hasRow: false,
                        width: size.width * 0.43,
                      ),
                    ]),
                Constants.spaceSmall,
                CommonImageView(svgPath: 'assets/svgs/price_range_image.svg'),
                RangeSlider(
                  activeColor: Constants.fromHex('#0095E9'),
                  inactiveColor: Constants.fromHex('#0095E9'),
                  divisions: 100,
                  min: 10,
                  max: 500,
                  values: RangeValues(controller.lowerstPrice.value.toDouble(),
                      controller.higestPrice.value.toDouble()),
                  onChanged: (rangeValues) {
                    setState(() {
                      controller.lowerstPrice.value = rangeValues.start.toInt();
                      controller.higestPrice.value = rangeValues.end.toInt();
                    });
                  },
                  onChangeStart: (value) {
                    setState(() {
                      controller.lowerstPrice.value = value.start.toInt();
                    });
                  },
                  onChangeEnd: (value) {
                    setState(() {
                      controller.higestPrice.value = value.end.toInt();
                    });
                  },
                  labels: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$ ${controller.lowerstPrice.value}",
                          style: Constants.normalTextStyle,
                        ),
                        Text(
                          '/hour',
                          style: Constants.subtitleTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ ${controller.higestPrice.value}",
                          style: Constants.normalTextStyle,
                        ),
                        Text(
                          '/hour',
                          style: Constants.subtitleTextStyle,
                        ),
                      ],
                    ),
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
                titleText("Rate Range".tr),
                Constants.spaceSmallColumn,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfessionalTypeContainer(
                      isSelected: isWorkingHours,
                      text: 'Working Hours'.tr,
                      onTap: onWorkingHoursSelected,
                      hasRow: false,
                    ),
                    ProfessionalTypeContainer(
                      isSelected: is247,
                      text: '24/7'.tr,
                      onTap: on247Tap,
                      hasRow: false,
                    ),
                    ProfessionalTypeContainer(
                      isSelected: isSpecifyHours,
                      text: 'Specify'.tr,
                      onTap: onSpecifyHoursSelected,
                      hasRow: false,
                    ),
                  ],
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
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => SportPlacesEventsPrograms(),
                      //   ),
                      //);
                      Get.back();
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
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
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
                        14, FontWeight.w500, Constants.indigo700)
                    : AppStyle.poppinsTextstyle(
                        14, FontWeight.w500, Constants.bluegray504),
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        ]));
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
