import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/widgets/small_text.dart';

//import '../../utils/constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_appbar.dart';
//import '../../widgets/forms.dart';
import '../../util/constants.dart';
import '../../widgets/form_widget.dart';
import '../../widgets/small_text_widget.dart';
import 'password_success.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final password = ValueNotifier<String>('');
    final confPassword = ValueNotifier<String>('');

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              CustomAppBar(
                text: 'resetpassword'.tr,
                function: () {
                  Get.back();
                },
              ),
              AnimatedCrossFade(
                  firstChild: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/change_password.svg',
                      height: size.height * 0.23,
                    ),
                    //  Image.asset(
                    //   'assets/images/password.png',
                    //   height: size.height * 0.23,
                    // ),
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),
              Constants.space,
              InputForms(
                obscure: true,
                description: 'newpassword'.tr,
                notifier: password,
                inputType: TextInputType.text,
                onChange: (val) {
                  password.value = val!;
                },
              ),
              InputForms(
                obscure: true,
                description: 'confpassword'.tr,
                notifier: confPassword,
                inputType: TextInputType.text,
                onChange: (val) {
                  confPassword.value = val!;
                },
              ),
              Constants.space,
              Text(
                'passcontains'.tr,
                style: const TextStyle(
                  color: Color(0xff34405E),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: password,
                builder: (_, focus, __) => Column(
                  children: [
                    PasswordCriteria(
                      success: password.value.length > 8,
                      text: 'characters'.tr,
                    ),
                    PasswordCriteria(
                      success: password.value.contains(RegExp(r'[a-z]')),
                      text: 'lowercase'.tr,
                    ),
                    PasswordCriteria(
                      success: password.value.contains(RegExp(r'[A-Z]')),
                      text: 'uppercase'.tr,
                    ),
                    PasswordCriteria(
                      success: password.value.contains(RegExp(r'[0-9]')),
                      text: 'numbers'.tr,
                    ),
                  ],
                ),
              ),
              Constants.space,
              Button(
                text: 'confirm'.tr,
                onPressed: () {
                  var data = {
                    'email': password.value,
                    'conf': confPassword.value,
                  };
                  if (password.value.isNotEmpty) {}
                  log(data.toString());
                  Get.to(const PasswordSuccess());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordCriteria extends StatelessWidget {
  final bool success;
  final String text;
  const PasswordCriteria({Key? key, required this.success, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          success
              ? Icon(
                  Icons.check_circle,
                  color: Constants.pColor,
                  size: 20,
                )
              : Container(
                  margin: const EdgeInsets.only(left: 2),
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffDEE1EA))),
                ),
          const SizedBox(width: 5),
          SmallText(
            text,
            textColor: !success ? Colors.red : null,
          ),
        ],
      ),
    );
  }
}
