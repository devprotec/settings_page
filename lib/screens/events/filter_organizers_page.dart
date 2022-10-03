import 'package:settings_page/controllers/events_controller.dart';
import 'package:settings_page/screens/events/add_location.dart';
import 'package:settings_page/screens/events/choose_organizer.dart';

import '../../util/exports.dart';

class FilterOrganizerPage extends StatefulWidget {
  const FilterOrganizerPage({Key? key}) : super(key: key);

  @override
  State<FilterOrganizerPage> createState() => _FilterOrganizerPageState();
}

class _FilterOrganizerPageState extends State<FilterOrganizerPage> {
  bool isWellness = false;
  bool isNutrition = true;
  bool isFitness = false;
  bool isAllRatings = true;
  bool is4Stars = false;
  bool isAllLocations = true;
  bool isInSportPlace = false;
  bool isOnline = false;
  String sortBy = "msg_individual_rate";
  int distance = 0;
  final sortOptions = [
    "msg_individual_rate",
    "msg_individual_rate_h",
    "msg_group_rate_l",
    "msg_group_rate_h",
  ];
  onNutritionTap() {
    setState(() {
      isNutrition = !isNutrition;
    });
  }

  onFitnessTap() {
    setState(() {
      isFitness = !isFitness;
    });
  }

  onWellnessTap() {
    setState(() {
      isWellness = !isWellness;
    });
  }

  onAllTap() {
    setState(() {
      isAllRatings = !isAllRatings;
    });
  }

  on4PlusTap() {
    setState(() {
      is4Stars = !is4Stars;
    });
  }

  onAllLocationsTap() {
    setState(() {
      isAllLocations = !isAllLocations;
    });
  }

  onInSportPlaceTap() {
    setState(() {
      isInSportPlace = !isInSportPlace;
    });
  }

  onOnlineTap() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EventsController());
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
                Constants.spaceMediumColumn,
                titleText("msg_professional_ty".tr),
                Constants.spaceSmallColumn,
                Row(
                  children: [
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isNutrition,
                        text: "lbl_nutrition".tr,
                        onTap: onNutritionTap),
                    SizedBox(
                      width: 15,
                    ),
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isFitness,
                        text: "lbl_fitness".tr,
                        onTap: onFitnessTap),
                    SizedBox(
                      width: 15,
                    ),
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isWellness,
                        text: "lbl_wellness".tr,
                        onTap: onWellnessTap),
                  ],
                ),
                Constants.spaceMediumColumn,
                titleText("lbl_sort_by".tr),
                Constants.spaceSmallColumn,
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      Get.bottomSheet(OptionsBottomSheet(items: sortOptions));
                    },
                    child: containterAndRow(controller.sortByOption.value.tr),
                  ),
                ),
                Constants.spaceMediumColumn,
                titleText("lbl_your_location".tr),
                Constants.spaceSmallColumn,
                GestureDetector(
                  onTap: () {
                    Get.to(AddLocation());
                  },
                  child: containterAndRow("msg_national_museum".tr),
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
                titleText("lbl_location".tr),
                Constants.spaceSmallColumn,
                Row(
                  children: [
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isAllLocations,
                        text: "lbl_all".tr,
                        onTap: onAllLocationsTap),
                    SizedBox(
                      width: 15,
                    ),
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isInSportPlace,
                        text: "lbl_in_sport_place".tr,
                        onTap: onInSportPlaceTap),
                    SizedBox(
                      width: 15,
                    ),
                    ProfessionalTypeContainer(
                        hasRow: false,
                        isSelected: isOnline,
                        text: "lbl_online".tr,
                        onTap: onOnlineTap),
                  ],
                ),
                Constants.spaceLargeColumn,
                Button(
                    text: "lbl_apply".tr,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ChooseOrganizer()));
                    }),
                Constants.spaceMediumColumn,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ProfessionalTypeContainer(
      {required bool isSelected,
      required String text,
      required Function() onTap,
      required bool hasRow}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
          Text(text,
              style: AppStyle.poppinsTextstyle(
                15,
                FontWeight.w400,
                Constants.gray900,
              )),
          Icon(
            Icons.arrow_forward_ios,
            color: Constants.inactiveIconColor,
            size: 16,
          ),
        ]));
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
}
