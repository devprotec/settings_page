import 'package:settings_page/util/exports.dart';

class PrivacyAndSecurityScreen extends StatefulWidget {
  const PrivacyAndSecurityScreen({Key? key}) : super(key: key);
  @override
  State<PrivacyAndSecurityScreen> createState() =>
      _PrivacyAndSecurityScreenPage();
}

class _PrivacyAndSecurityScreenPage extends State<PrivacyAndSecurityScreen> {
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              AnimatedCrossFade(
                  firstChild: Center(
                      child: CommonImageView(
                    svgPath: ImageConstant.imgIllustration,
                  )),
                  secondChild: const SizedBox(),
                  crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),
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
                    settingsName: "lbl_change_password".tr,
                    hasSubtitle: false,
                  ),
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_11.png",
                    settingsName: 'terms_condtions'.tr,
                    hasSubtitle: false,
                  ),
                  SettingListTitle(
                    imageFile: "assets/images/img_icon_12.png",
                    settingsName: "lbl_delete_accou".tr,
                    hasSubtitle: false,
                    voidCallback: () => Get.to(DeleteAccountPage1()),
                  ),
                ]),
              ),
              Obx((() => controller.passwordChangedIsSuccessful.value
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: ErrorMessageV1(
                          infoIcon: CustomIcons.checkmark,
                          message: "msg_passwords_chang".tr,
                          messageBackgroundColor:
                              Constants.successBacgroundColor,
                          messageColor: Constants.successColor),
                    )
                  : SizedBox.shrink()))
            ],
          ),
        ),
      ),
    );
  }
}
