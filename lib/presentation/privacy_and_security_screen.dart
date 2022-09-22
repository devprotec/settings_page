import 'package:settings_page/presentation/change_password_page.dart';
import 'package:settings_page/util/exports.dart';

import '../util/image_constant.dart';
import '../widgets/common_image_view.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
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
                          "msg_privacy_secur".tr,
                          style: Constants.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]))),
      body: SingleChildScrollView(
        child: Column(children: [
           
          Align(
              alignment: Alignment.topCenter,
              child: CommonImageView(
                  svgPath: ImageConstant.imgIllustration,
                  height: getVerticalSize(250.00),
                  width: getHorizontalSize(320.00))),
          //Constants.spaceSmallColumn,
          Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                width: double.infinity,
                decoration: AppDecoration.outlineLightblue90019
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(children: [
          SettingListTitle(
            voidCallback: (){
               Get.to(ChangePasswordPage(), transition: Transition.fade);
            },
            imageFile: "assets/images/img_icon_10.png",
            settingsName: "Change Password",
            hasSubtitle: false,
          ),
          SettingListTitle(
            imageFile: "assets/images/img_icon_11.png",
            settingsName: "Terms & Conditions",
            hasSubtitle: false,
          ),
          SettingListTitle(
            imageFile: "assets/images/img_icon_12.png",
            settingsName: "Delete Account",
            hasSubtitle: false,
          ),
        ]),
      ),
    ]))));
  }
}
