import 'package:settings_page/util/exports.dart';




class SelectRolePage extends StatelessWidget {
  List<Role> newRole = [
    Role("msg_certified_sport".tr, Status.Active),
    Role("msg_non_certified_s".tr, Status.Active),
    Role("lbl_reseller".tr, Status.Active),
    Role("lbl_b2b_partner".tr, Status.Active),
    Role("msg_corporate_partn".tr, Status.Pending),
    Role("msg_wellness_profes".tr, Status.Pending),
    Role("msg_knowledge_profe".tr, Status.Inactive),
  ];

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
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
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
          child: Container(
            height: height,
            child: ListView.builder(
                itemCount: newRole.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  return SettingListTitleCompact(
                    imageFile: settingsPicturePath[index],
                    settingsName: settingsName[index],
                    voidCallback: () {
                    },
                    status: newRole[index].status,
                  );
                }),
          ),
        ),
      ),
    ));
  }
}
/* 
Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[0],
                    settingsName: settingsName[0],
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[0].status),
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[1],
                    settingsName: newRole[1].text,
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[1].status),
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[2],
                    settingsName: newRole[2].text,
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[2].status),
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[3],
                    settingsName: newRole[3].text,
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[3].status),
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[4],
                    settingsName: newRole[4].text,
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[4].status),
                SettingListTitleCompact(
                    imageFile: settingsPicturePath[5],
                    settingsName: newRole[5].text,
                    voidCallback: () {
                      // Get.to(page);
                    },
                    status: newRole[5].status),
                SettingListTitleCompact(
                  imageFile: settingsPicturePath[6],
                  settingsName: newRole[6].text,
                  voidCallback: () {
                    // Get.to(page);
                  },
                  status: newRole[6].status,
                ),
              ],
            ),
 */