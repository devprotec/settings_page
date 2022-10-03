import 'package:settings_page/util/exports.dart';

class AccountDeletedPage extends StatelessWidget {
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
            hasActions: false,
            appBarTitle: "lbl_account_deleted".tr,
          ),
        ),
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(bottom: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CommonImageView(
                      svgPath: ImageConstant.imgBluemondaypan,
                    ),
                    Constants.spaceSemiBigColumn,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65.0),
                      child: Text(
                        "msg_it_is_a_pity_th".tr,
                        style: AppStyle.txtPoppinsSemiBold24Gray900,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  child: Button(
                    text: "lbl_go_to_log_in".tr,
                    buttonColor: Constants.lightBlue50,
                    buttonElevation: 0,
                    onPressed: () {
                      Get.to(SelectRolePage());
                    },
                    textColor: Constants.lightBlue700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
