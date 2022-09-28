import 'package:settings_page/util/exports.dart';
import 'package:settings_page/widgets/timeline_widget.dart';
import 'package:widget_mask/widget_mask.dart';

class EmptyCreateEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.32),
          child: Stack(
            children: [
              WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: FittedBox(
                  fit: BoxFit.fill,
                  child: Container(),
                ),
                child: CommonImageView(
                  svgPath: "assets/images/img_background_appbar.svg",
                ),
              ),
              AppbarWidget(
                hasActions: true,
                appBarTitle: "lbl_create_event".tr,
                trailingWidget: Constants.trailingWidget(
                  "assets/images/img_menu.svg",
                  () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.239,
                  right: 24.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      onTap: () {
                        //checkPermission();
                      },
                      child: CommonImageView(
                        imagePath: "assets/images/img_icon_camera.png",
                      )),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                Text(
                  "lbl_untitled_event".tr,
                  style: AppStyle.txtPoppinsSemiBoldGray24,
                ),
                TimelineWidget(
                  isLast: false,
                  isFirst: true,
                  tileText: 'Hello World',
                  tileIcon: "assets/images/img_vector_12X14.png",
                  indicatorColor: Constants.gray100,
                  tileTextColor: Constants.gray900,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
