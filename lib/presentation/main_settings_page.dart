import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_page/widgets/app_bar_widget.dart';
import 'package:settings_page/widgets/columWidget.dart';

import '../theme/app_decoration.dart';
import '../util/constants.dart';
import '../util/math_utils.dart';

class MainSettingsPage extends StatelessWidget {
  static const String routeName = "main_settings";

  const MainSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(
          appBarTitle: "lbl_settings".tr,
          hasActions: true,
        ),
      ),
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
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_32X32.png",
                    settingName: "Notifications",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_1.png",
                    settingName: "Privacy & Security",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_2.png",
                    settingName: "Become Professional",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_3.png",
                    settingName: "Units & Timezone",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                      hasSubtitle: true,
                      subTitleText: "English",
                      imageFile: "assets/images/img_icon_4.png",
                      settingName: "Language"),
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
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_5.png",
                    settingName: "Orders",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_6.png",
                    settingName: "Integration",
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
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_7.png",
                    settingName: "About",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_8.png",
                    settingName: "Support",
                    hasSubtitle: false,
                  ),
                  ColumnWidget(
                    imageFile: "assets/images/img_icon_9.png",
                    settingName: "Leave Feedback",
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
          ],
        ),
      ),
    ));
  }
}
