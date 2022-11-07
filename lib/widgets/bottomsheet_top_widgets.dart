import 'package:settings_page/util/exports.dart';

class BottomSheetTopWidgets extends StatelessWidget {
  final String title;
  const BottomSheetTopWidgets({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                height: getVerticalSize(4.00),
                width: getHorizontalSize(32.00),
                margin: getMargin(left: 24, top: 8, right: 24),
                decoration: BoxDecoration(
                    color: Constants.bluegray50,
                    borderRadius:
                        BorderRadius.circular(getHorizontalSize(2.00))))),
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
                          child: Text(title.tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsSemiBold16
                                  .copyWith(height: 1.00))),
                      Padding(
                          padding: getPadding(left: 112, bottom: 5),
                          child: GestureDetector(
                              onTap: () => Get.back(), child: closeButton()))
                    ]))),
      ],
    );
  }
}

Widget closeButton() {
  return CommonImageView(
      svgPath: ImageConstant.imgClose,
      height: getVerticalSize(12.00),
      width: getHorizontalSize(13.00));
}
