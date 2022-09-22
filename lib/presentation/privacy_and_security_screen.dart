import 'package:settings_page/presentation/change_password_page.dart';
import 'package:settings_page/presentation/delete_account_page1.dart';
import 'package:settings_page/util/exports.dart';
import 'package:settings_page/widgets/app_bar_widget.dart';

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
                child: AppbarWidget(
                  appBarTitle: "msg_privacy_secur".tr,
                  hasActions: true,
                )),
            body: SingleChildScrollView(
                child: Column(children: [

                  AnimatedCrossFade(
                    firstChild: Center(
                        child: CommonImageView(
                            svgPath: ImageConstant.imgIllustration,
                            height: getVerticalSize(200.00),
                            width: getHorizontalSize(250.00))),
                    secondChild: const SizedBox(),
                    crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400)),
              
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
                    voidCallback: () {
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
                    voidCallback: () => Get.to(DeleteAccountPage1()),
                  ),
                ]),
              ),
            ]))));
  }
}
