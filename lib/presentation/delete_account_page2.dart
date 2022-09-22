import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:settings_page/presentation/account_deleted_page.dart';
import 'package:settings_page/theme/app_style.dart';
import 'package:settings_page/widgets/app_bar_widget.dart';
import 'package:settings_page/widgets/button_widget.dart';

import '../util/constants.dart';
import '../util/math_utils.dart';
import '../widgets/checkbox_with_text_widget.dart';

class DeleteAccountPage2 extends StatefulWidget {
  @override
  State<DeleteAccountPage2> createState() => _DeleteAccountPage2State();
}

class _DeleteAccountPage2State extends State<DeleteAccountPage2> {
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
            padding: const EdgeInsets.only(top: 16),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "msg_we_are_sad_to_s".tr,
                  style: AppStyle.txtPoppinsSemiBold24Gray900,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27.0),
                  child: Text(
                    "msg_before_you_go".tr,
                    style: Constants.subtitleTextStyle,
                  ),
                ),
                Constants.spaceMediumColumn,
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_it_was_not_effe".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_i_have_another".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_this_was_a_test".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_it_was_dificult".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_i_have_another".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_it_lacks_key_fe".tr,
                ),
                ChechboxWithTextWidget(
                  initialValue: confirmDeleteChecked,
                  checkBoxMessage: "msg_i_use_another_a".tr,
                ),
                SizedBox(
                  height: 24,
                ),

                /* ButtonWidget(
                  buttonName: "lbl_leave_feedback".tr, 
                  buttonColor: buttonColor, 
                  buttonWidth: buttonWidth, 
                  buttonAction: buttonAction, 
                  fontStyle: fontStyle,) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
