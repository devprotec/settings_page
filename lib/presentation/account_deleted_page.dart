import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_page/util/constants.dart';
import 'package:settings_page/widgets/button_widget.dart';

import '../theme/app_style.dart';
import '../widgets/app_bar_widget.dart';

class AccountDeletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(
          hasActions: false,
          appBarTitle: 'Account Deleted',
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
                    height: 40,
                  ),
                  Image.asset("assets/images/account_deleted_alert.png"),
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
                child: ButtonWidget(
                  buttonName: "lbl_go_to_log_in".tr,
                  buttonColor: Constants.lightBlue50,
                  buttonWidth: width,
                  buttonAction: () {},
                  fontStyle: AppStyle.txtPoppinsSemiBold14LightBlue700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
