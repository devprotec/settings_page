import 'package:settings_page/util/exports.dart';

class DeleteAccountPage1 extends StatefulWidget {
  @override
  State<DeleteAccountPage1> createState() => _DeleteAccountPage1State();
}

class _DeleteAccountPage1State extends State<DeleteAccountPage1> {
  bool confirmDeleteChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            hasActions: true,
            appBarTitle: 'Delete Account',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                //Image.asset("assets/images/delete_account_alert.png"),
                CommonImageView(svgPath: ImageConstant.imgIllustration206X206,),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "lbl_are_you_sure".tr,
                  style: AppStyle.txtPoppinsSemiBold24Gray900,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65.0),
                  child: Text(
                    "msg_you_will_lost_a".tr,
                    style: AppStyle.txtPoppinsRegular14,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: confirmDeleteChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          confirmDeleteChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "msg_i_am_sure_i_wan".tr,
                      style: AppStyle.txtPoppinsRegular14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ), */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27.0),
                  child: ChechboxWithTextWidget(
                    initialValue: confirmDeleteChecked,
                    checkBoxMessage: "msg_i_am_sure_i_wan".tr,
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(DeleteAccountPage2());
                  },
                  child: Text(
                    "lbl_delete_account".tr,
                    style: AppStyle.txtPoppinsSemiBold14Red500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
