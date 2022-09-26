import 'package:settings_page/util/exports.dart';

class LanguageBottomSheet extends GetView<SettingsController> {
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: AppDecoration.outlineGray7000f.copyWith(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: getVerticalSize(4.00),
                        width: getHorizontalSize(32.00),
                        margin: getMargin(left: 24, top: 8, right: 24),
                        decoration: BoxDecoration(
                            color: Constants.bluegray50,
                            borderRadius: BorderRadius.circular(
                                getHorizontalSize(2.00))))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: getPadding(left: 21, top: 17, right: 21),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                  padding: getPadding(top: 1),
                                  child: Text("lbl_language".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold16
                                          .copyWith(height: 1.00))),
                              Padding(
                                  padding: getPadding(left: 112, bottom: 5),
                                  child: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgClose,
                                        height: getVerticalSize(12.00),
                                        width: getHorizontalSize(13.00)),
                                  ))
                            ]))),
                LanguageListTile(
                    languageName: "lbl_english".tr,
                    languageImage: CommonImageView(
                        imagePath: ImageConstant.imgFlag,
                        height: getVerticalSize(16.00),
                        width: getHorizontalSize(20.00))),
                LanguageListTile(
                    languageName: "lbl_french".tr,
                    languageImage: CommonImageView(
                        imagePath: ImageConstant.imgFlag16X20,
                        height: getVerticalSize(16.00),
                        width: getHorizontalSize(20.00))),
                LanguageListTile(
                    languageName: "lbl_akan".tr,
                    languageImage: CommonImageView(
                        imagePath: ImageConstant.imgFlag1,
                        height: getVerticalSize(16.00),
                        width: getHorizontalSize(20.00))),
              ])),
    );
  }
}

class LanguageListTile extends StatelessWidget {
  final settingsController = Get.put(SettingsController());
  final String languageName;
  final CommonImageView languageImage;
  LanguageListTile(
      {Key? key, required this.languageName, required this.languageImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 5,
        title: Text(
          languageName,
          style: Constants.languageTextStyle,
        ),
        leading: languageImage,
        onTap: () {
          settingsController.selectedLanguage.value = languageName;
          Get.back();
        },
        trailing: languageName
                .contains(settingsController.selectedLanguage.value.toString())
            ? CommonImageView(
                imagePath: ImageConstant.imgVector20X20,
                height: getSize(20.00),
                width: getSize(20.00))
            : SizedBox.shrink());
  }
}
