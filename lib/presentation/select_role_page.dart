import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/setting_listTile.dart';

class SelectRolePage extends StatelessWidget {
  final settingsPicturePath = [
    "assets/images/img_vector.png",
    "assets/images/img_vector.png",
    "assets/images/img_vector_14X13.png",
    "assets/images/img_vector_12X13.png",
    "assets/images/img_vector_12X14.png",
    "assets/images/img_vector_14X10.png",
    "assets/images/img_vector_13X12.png",
  ];

  final settingsName = [
    "msg_certified_sport".tr,
    "msg_non_certified_s".tr,
    "lbl_reseller".tr,
    "lbl_b2b_partner".tr,
    "msg_corporate_partn".tr,
    "msg_wellness_profes".tr,
    "msg_knowledge_profe".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(
          hasActions: true,
          appBarTitle: "msg_select_your_rol".tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingListTitleCompact(
                imageFile: settingsPicturePath[0],
                settingsName: settingsName[0],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[1],
                settingsName: settingsName[1],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[2],
                settingsName: settingsName[2],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[3],
                settingsName: settingsName[3],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[4],
                settingsName: settingsName[4],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[5],
                settingsName: settingsName[5],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
              SettingListTitleCompact(
                imageFile: settingsPicturePath[6],
                settingsName: settingsName[6],
                hasSubtitle: false,
                voidCallback: () {
                  // Get.to(page);
                },
                hasTrailing: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
