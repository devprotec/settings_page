import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_page/controllers/settings_controller.dart';
import 'package:settings_page/presentation/privacy_and_security_screen.dart';
import 'package:settings_page/widgets/setting_listTile.dart';
import 'package:settings_page/widgets/language_bottom_sheet.dart';

//import 'package:settings_page/widgets/columWidget.dart';


import '../theme/app_decoration.dart';
import '../util/constants.dart';
import '../util/math_utils.dart';


class MainSettingsPage extends StatefulWidget {
  MainSettingsPage({Key? key}) : super(key: key);

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  var settingsController = Get.put(SettingsController());
  final settingsName = [
    "Notifications",
    "Privacy & Security",
    "Become Professional",
    "Units & Timezone",
    "Language",
    "Orders",
    "Integration",
    "About",
    "Support",
    "Leave Feedback"
  ];
  final settingsPicturePath = [
    "assets/images/img_icon_32X32.png",
    "assets/images/img_icon_1.png",
    "assets/images/img_icon_2.png",
    "assets/images/img_icon_3.png",
    "assets/images/img_icon_4.png",
    "assets/images/img_icon_5.png",
    "assets/images/img_icon_6.png",
    "assets/images/img_icon_7.png",
    "assets/images/img_icon_8.png",
    "assets/images/img_icon_9.png",
  ];




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(

          preferredSize: Size.fromHeight(50),
          child: Container(
              margin: getMargin(left: 12, right: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Constants.arrowBacks(),
                    Container(
                      width: size.width * 0.8,
                      child: Center(
                        child: Text(
                          "lbl_settings".tr,
                          style: Constants.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]))),

      

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              width: double.infinity,
              decoration: AppDecoration.outlineLightblue90019
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                children: [
                  // for (int i = 0; i < 5; i++)
                  //   i == 4
                  //       ? Obx((() => SettingListTitle(
                  //           imageFile: settingsPicturePath[i],
                  //           settingsName: settingsName[i],
                  //           hasSubtitle: true,
                  //           subTitleText: "${settingsController.selectedLanguage.value}",
                  //           voidCallback: () {
                  //             Get.bottomSheet(LanguageBottomSheet());
                  //           })))
                  //       : SettingListTitle(
                  //           imageFile: settingsPicturePath[i],
                  //           settingsName: settingsName[i],
                  //           hasSubtitle: false,
                  //         ),

                        SettingListTitle(
                            imageFile: settingsPicturePath[0],
                            settingsName: settingsName[0],
                            hasSubtitle: false,
                            voidCallback: () {
                             // Get.to(page);
                            }),
                        SettingListTitle(
                            imageFile: settingsPicturePath[1],
                            settingsName: settingsName[1],
                            hasSubtitle: false,
                            voidCallback: () {
                              Get.to(PrivacyAndSecurityScreen(), transition: Transition.fade);
                            }),
                        SettingListTitle(
                            imageFile: settingsPicturePath[2],
                            settingsName: settingsName[2],
                            hasSubtitle: false,
                            voidCallback: () {
                             // Get.to(page);
                            }),
                        SettingListTitle(
                            imageFile: settingsPicturePath[3],
                            settingsName: settingsName[3],
                            hasSubtitle: false,
                            voidCallback: () {
                             // Get.to(page);
                            }),
                        Obx((() => SettingListTitle(
                            imageFile: settingsPicturePath[4],
                            settingsName: settingsName[4],
                            hasSubtitle: true,
                            subTitleText: "${settingsController.selectedLanguage.value}",
                            voidCallback: () {
                              Get.bottomSheet(LanguageBottomSheet());
                            })))
                ],
              ),
            ),
            Constants.spaceSmallColumn,
            Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                width: double.infinity,
                decoration: AppDecoration.outlineLightblue90019
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(children: [
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_5.png",
                    settingsName: "Orders",
                    hasSubtitle: false,
                  ),
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_6.png",
                    settingsName: "Integration",
                    hasSubtitle: false,
                  ),
                ])),
            Constants.spaceSmallColumn,
            Container(
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                width: double.infinity,
                decoration: AppDecoration.outlineLightblue90019
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(children: [
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_7.png",
                    settingsName: "About",
                    hasSubtitle: false,
                  ),
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_8.png",
                    settingsName: "Support",
                    hasSubtitle: false,
                  ),
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_9.png",
                    settingsName: "Leave Feedback",
                    hasSubtitle: false,
                  ),
                ])),
            Constants.spaceMediumColumn,
            Center(
              child: Text(
                "LOG OUT",
                style: Constants.fainted_logout,
              ),
            ),

            Constants.spaceMediumColumn,


          ],
        ),
      ),
    ));
  }
}
