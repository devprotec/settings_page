import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:settings_page/util/constants.dart';

import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import '../util/image_constant.dart';
import '../util/math_utils.dart';
import '../widgets/common_image_view.dart';


class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            margin: getMargin(top: 121, bottom: 121),
            decoration: AppDecoration.outlineGray7000f
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
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
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgClose,
                                        height: getVerticalSize(12.00),
                                        width: getHorizontalSize(13.00)))
                              ]))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 21, top: 12, right: 21),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding:
                                        getPadding(left: 2, top: 4, bottom: 3),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              2.00)),
                                                  child: CommonImageView(
                                                      imagePath:
                                                          ImageConstant.imgFlag,
                                                      height: getVerticalSize(
                                                          16.00),
                                                      width: getHorizontalSize(
                                                          20.00)))),
                                          Padding(
                                              padding:
                                                  getPadding(left: 14, top: 2),
                                              child: Text("lbl_english".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Gray900
                                                      .copyWith(height: 1.00)))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 2),
                                    child: CommonImageView(
                                        imagePath: ImageConstant.imgVector20X20,
                                        height: getSize(20.00),
                                        width: getSize(20.00)))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: getMargin(top: 13),
                          decoration: AppDecoration.fillWhiteA700,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 26, top: 16, bottom: 17),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(2.00)),
                                        child: CommonImageView(
                                            imagePath:
                                                ImageConstant.imgFlag16X20,
                                            height: getVerticalSize(16.00),
                                            width: getHorizontalSize(20.00)))),
                                Padding(
                                    padding: getPadding(
                                        left: 14, top: 16, bottom: 18),
                                    child: Text("lbl_french".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular14Gray900
                                            .copyWith(height: 1.00)))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: getMargin(bottom: 58),
                          decoration: AppDecoration.fillWhiteA700,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 26, top: 16, bottom: 17),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(2.00)),
                                        child: CommonImageView(
                                            imagePath: ImageConstant.imgFlag1,
                                            height: getVerticalSize(16.00),
                                            width: getHorizontalSize(20.00)))),
                                Padding(
                                    padding: getPadding(
                                        left: 14, top: 16, bottom: 18),
                                    child: Text("lbl_akan".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular14Gray900
                                            .copyWith(height: 1.00)))
                              ])))
                ])));
  }
}
