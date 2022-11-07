import 'package:settings_page/util/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = ValueNotifier<String>('');
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04),
              CustomAppBar(
                text: 'resetpassword'.tr,
                function: () {
                  Get.back();
                },
              ),
              Offstage(
                offstage: MediaQuery.of(context).viewInsets.bottom != 0,
                child: SvgPicture.asset(
                  'assets/svgs/reset_password.svg',
                  height: size.height * 0.4,
                ),
                // Image.asset(
                //   'assets/images/reset.png',
                //   height: size.height * 0.4,
                // ),
              ),
              Text.rich(
                TextSpan(
                  text: '',
                  style: const TextStyle(
                    color: Color(0xff6E768D),
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'resetMessage'.tr,
                      //  ' To reset your password, please \nenter the email address of your account\n  ',
                    ),
                    TextSpan(
                      text: 'myhealth'.tr,
                      // 'myHealthCop ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'account'.tr),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const ErrorMessage(
                message: '',
              ),
              Constants.space,
              Obx(() => InputForms(
                    obscure: false,
                    description: 'Email',
                    notifier: email,
                    validation: FormBuilderValidators.compose([
                      if (_authController.hasError.value) ...[
                        FormBuilderValidators.required(
                            errorText: 'required'.tr),
                        FormBuilderValidators.email(errorText: 'Invalid email'),
                      ]
                    ]),
                    inputType: TextInputType.emailAddress,
                    onChange: (val) {
                      email.value = val!;
                    },
                  )),
              Constants.space,
              Constants.space,
              Button(
                text: 'confirm'.tr,
                onPressed: () {
                  print(email.value);
                  if (email.value.isNotEmpty && GetUtils.isEmail(email.value)) {
                    _authController.forgotPassword(email: email.value);
                  } else {
                    _authController.hasError.value = true;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
