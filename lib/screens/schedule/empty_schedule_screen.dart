import 'package:settings_page/util/exports.dart';

class EmptyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(
          hasActions: true,
          appBarTitle: "lbl_my_sched".tr,
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            CommonImageView(
              svgPath: "assets/images/img_nothing_scheduled.svg",
            ),
            Text(
              "lbl_there_is_no_sched".tr,
              style: AppStyle.txtPoppinsSemiBoldBlueGray18,
            )
          ],
        ),
      ),
    );
  }
}
