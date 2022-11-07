import 'package:mhc_customer/util/exports.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final controller = Get.put(SettingsController());
  final currentPassword = ValueNotifier<String>('');
  final newPassword = ValueNotifier<String>('');
  final confPassword = ValueNotifier<String>('');
  bool error = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: AppbarWidget(
              hasActions: true,
              appBarTitle: "lbl_change_password".tr,
            ),
            preferredSize: Size.fromHeight(50)),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.05),

                AnimatedCrossFade(
                    firstChild: Center(
                        child: CommonImageView(
                            svgPath: ImageConstant.imgIllustration1,
                            height: getVerticalSize(147.00),
                            width: getHorizontalSize(160.00))),
                    secondChild: const SizedBox(),
                    crossFadeState:
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400)),

                Obx(() => controller.changePasswordError.value
                    ? ErrorMessage(
                        message: controller.changePasswordErrorMessage.value,
                      )
                    : SizedBox.shrink()),
                Constants.spaceMediumColumn,
                InputForms(
                  suffixIconSize: 12,
                  descriptionTextStyle: Constants.subtitleTextStyle,
                  visiblePasswordIcon: CustomIcons.img_settings,
                  hiddenPasswordIcon: CustomIcons.img_settings,
                  enabled: true,
                  obscure: true,
                  description: 'currentpassword'.tr,
                  notifier: currentPassword,
                  //controller: passwordController,
                  inputType: TextInputType.text,

                  onChange: (val) {
                    currentPassword.value = val!;
                  },
                ),
                InputForms(
                  suffixIconSize: 12,
                  descriptionTextStyle: Constants.subtitleTextStyle,
                  visiblePasswordIcon: CustomIcons.img_settings,
                  hiddenPasswordIcon: CustomIcons.img_settings,
                  enabled: true,
                  obscure: true,
                  description: 'newpassword'.tr,
                  notifier: newPassword,
                  //controller: passwordController,
                  inputType: TextInputType.text,

                  onChange: (val) {
                    newPassword.value = val!;
                  },
                ),
                InputForms(
                  //validation: valin,
                  suffixIconSize: 12,
                  descriptionTextStyle: Constants.subtitleTextStyle,
                  visiblePasswordIcon: CustomIcons.img_settings,
                  hiddenPasswordIcon: CustomIcons.img_settings,
                  //controller: confirmPasswordController,
                  enabled: true,
                  obscure: true,
                  description: 'confpassword'.tr,
                  notifier: confPassword,
                  inputType: TextInputType.text,
                  onChange: (val) {
                    confPassword.value = val!;
                  },
                ),
                // Constants.spaceMediumColumn,
                // Text(
                //   'passcontains'.tr,
                //   style: const TextStyle(
                //     color: Color(0xff34405E),
                //   ),
                // ),
                // ValueListenableBuilder(
                //   valueListenable: password,
                //   builder: (_, focus, __) => Column(
                //     children: [
                //       PasswordCriteria(
                //         success: password.value.length > 8,
                //         text: 'characters'.tr,
                //       ),
                //       PasswordCriteria(
                //         success: password.value.contains(RegExp(r'[a-z]')),
                //         text: 'lowercase'.tr,
                //       ),
                //       PasswordCriteria(
                //         success: password.value.contains(RegExp(r'[A-Z]')),
                //         text: 'uppercase'.tr,
                //       ),
                //       PasswordCriteria(
                //         success: password.value.contains(RegExp(r'[0-9]')),
                //         text: 'numbers'.tr,
                //       ),
                //     ],
                //   ),
                // ),
                Constants.spaceMediumColumn,
                Button(
                  text: 'lbl_confirm'.tr,
                  onPressed: () {
                    controller.onPasswordChange(currentPassword.value,
                        newPassword.value, confPassword.value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class PasswordCriteria extends StatelessWidget {
//   final bool success;
//   final String text;
//   const PasswordCriteria({Key? key, required this.success, required this.text})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: Row(
//         children: [
//           success
//               ? Icon(
//                   Icons.check_circle,
//                   color: Constants.successPasswordColor,
//                   size: 20,
//                 )
//               : Container(
//                   margin: const EdgeInsets.only(left: 2),
//                   height: 17,
//                   width: 17,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: const Color(0xffDEE1EA))),
//                 ),
//           const SizedBox(width: 5),
//           SmallText(
//             text,
//             textColor: !success ? Colors.red : null,
//           ),
//         ],
//       ),
//     );
//   }
// }
