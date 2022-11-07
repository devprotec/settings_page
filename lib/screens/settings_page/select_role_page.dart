// ignore_for_file: must_be_immutable

import 'package:mhc_customer/util/exports.dart';

class SelectRolePage extends StatelessWidget {
  List<ProfessionalRole> newRole = [
    ProfessionalRole("msg_certified_sport".tr, Status.Active),
    ProfessionalRole("msg_non_certified_s".tr, Status.Active),
    ProfessionalRole("lbl_reseller".tr, Status.Active),
    ProfessionalRole("lbl_b2b_partner".tr, Status.Active),
    ProfessionalRole("msg_corporate_partn".tr, Status.Pending),
    ProfessionalRole("msg_wellness_profes".tr, Status.Pending),
    ProfessionalRole("msg_knowledge_profe".tr, Status.Inactive),
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
                    return GestureDetector(
                      onTap: () {
                        Get.to(EmptyCreateEventPage());
                      },
                      child: SettingListTitleCompact(
                        imageFile: settingsPicturePath[index],
                        settingsName: newRole[index].text,
                        voidCallback: () {},
                        status: newRole[index].status,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
