import 'package:settings_page/util/exports.dart';

class EventSchdule extends StatelessWidget {
  const EventSchdule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppbarWidget(
                    appBarTitle: "lbl_event_schedule".tr, hasActions: true)),
            body: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Constants.spaceMediumColumn,
                    Center(
                      child: CommonImageView(
                          svgPath: "assets/images/img_ill_228X275.svg",
                          height: getVerticalSize(228.00),
                          width: getHorizontalSize(275.00)),
                    ),
                    Constants.spaceLargeColumn,
                    Constants.spaceLargeColumn,
                    Text("msg_there_is_no_act".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.poppinsTextstyle(
                            16, FontWeight.w500, Constants.fromHex("#34405E"))),
                    Constants.spaceLargeColumn,
                    
                  ],
                ))));
  }
}
