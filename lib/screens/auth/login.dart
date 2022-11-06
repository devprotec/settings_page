import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/screens/auth/account_creation.dart';
//import 'package:mhc_consumer/screens/auth/reset_password.dart';
//import 'package:mhc_consumer/shared_controllers/auth_controller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:settings_page/screens/auth/reset_password.dart';
//import '../../utils/constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/error_message.dart';
//import '../../widgets/forms.dart';
//import '../../widgets/small_text.dart';
import '../../../widgets/title_text.dart';
import '../../controllers/auth_controller.dart';
import '../../util/constants.dart';
import '../../widgets/form_widget.dart';
import '../../widgets/small_text_widget.dart';
import 'account_creation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var authController = Get.put(AuthController());
  final password = ValueNotifier<String>('');
  final email = ValueNotifier<String>('');
  bool checkedValue = false;

  bool seePassword = true;

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        resizeToAvoidBottomInset: false,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: size.height * 0.08),
              Offstage(
                  offstage: MediaQuery.of(context).viewInsets.bottom != 0,
                  child: Image.asset(Constants.logo)),
              Offstage(
                  offstage: MediaQuery.of(context).viewInsets.bottom != 0,
                  child: Constants.space),
              Offstage(
                  offstage: MediaQuery.of(context).viewInsets.bottom != 0,
                  child: const Center(child: TitleText('Login'))),
              const ErrorMessage(
                message: '',
              ),
              Constants.space,
              Constants.space,
              Obx(() => InputForms(
                obscure: false,
                    description: 'Email',
                    notifier: email,
                    validation: FormBuilderValidators.compose([
                      if (authController.hasError.value) ...[
                        FormBuilderValidators.required(
                            errorText: 'required'.tr),
                        FormBuilderValidators.email(errorText: 'invalid email'),
                      ]
                    ]),
                    enabled: authController.isFormFieldsEnabled.value,
                    inputType: TextInputType.emailAddress,
                    onChange: (val) {
                      email.value = val!;
                    },
                  )),
              Obx(() => InputForms(
                    description: 'Password',
                    notifier: password,
                    obscure: seePassword,
                    enabled: authController.isFormFieldsEnabled.value,
                    suffixicon: IconButton(
                        icon: Icon(seePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            seePassword = !seePassword;
                          });
                        }),
                    inputType: TextInputType.emailAddress,
                    validation: FormBuilderValidators.compose([
                      if (authController.hasError.value) ...[
                        FormBuilderValidators.required(
                            errorText: 'required'.tr),
                      ]
                    ]),
                    onChange: (val) {
                      password.value = val!;
                    },
                  )),
              Constants.space,
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const ForgotPassword());
                  },
                  child: const Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(
                      color: Color(0xff0095E9),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Constants.space,
              Obx(
                () => authController.isLoggingIn.isTrue
                    ? const CircularProgressIndicator()
                    : Button(
                        text: 'LOG IN',
                        onPressed: () {
                          if (email.value.isNotEmpty &&
                              password.value.isNotEmpty) {
                            var data = {
                              'email': email.value,
                              'password': password.value,
                            };
                            authController.logIn(
                                email: email.value.trim(),
                                password: password.value.trim());
                            log(data.toString());
                          } else {
                            authController.hasError.value = true;
                          }
                        },
                      ),
              ),
              Constants.space,
              const Center(child: SmallText('Or continue with')),
              Constants.space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularItems(
                    image: 'google.png',
                    onPress: () {},
                  ),
                  CircularItems(
                    image: 'apple.png',
                    onPress: () {},
                  )
                ],
              ),
              Constants.space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SmallText('Need an account? '),
                  GestureDetector(
                    onTap: () {
                      Get.to(const AccountCreation());
                    },
                    child: const Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(
                        color: Color(0xff0095E9),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class CircularItems extends StatelessWidget {
  final String image;
  final VoidCallback onPress;
  const CircularItems({Key? key, required this.image, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffE6E8F3),
            )),
        child: Image.asset('assets/images/$image'),
      ),
    );
  }
}
