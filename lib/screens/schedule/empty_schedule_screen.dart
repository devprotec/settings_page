import 'package:mhc_customer/screens/schedule/setup_schedule.dart';
import 'package:mhc_customer/util/exports.dart';

class EmptyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
              SizedBox(
                height: 69,
              ),
              CommonImageView(
                svgPath: "assets/images/img_nothing_scheduled.svg",
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "lbl_there_is_no_sched".tr,
                style: AppStyle.txtPoppinsSemiBoldBlueGray18,
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62.0),
                child: ButtonIcon(
                  text: "lbl_setup_sched".tr,
                  onPressed: () {
                    Get.to(() => SetUpSchedule());
                  },
                  icon: Icons.add,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
