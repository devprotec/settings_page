import 'package:settings_page/util/exports.dart';
import 'package:settings_page/widgets/bottomsheet_top_widgets.dart';

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
                BottomSheetTopWidgets(title: "lbl_language"),
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
