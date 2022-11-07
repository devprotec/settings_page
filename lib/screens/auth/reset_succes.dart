import 'package:settings_page/util/exports.dart';

class ResetSuccess extends StatelessWidget {
  final String email;
  const ResetSuccess({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthController _authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),
              CustomAppBar(
                text: 'resetsucess'.tr,
                function: () {
                  Get.back();
                },
              ),
              SvgPicture.asset(
                'assets/svgs/reset_success.svg',
                height: size.height * 0.5,
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
                      text: 'mailto'.tr,
                    ),
                    TextSpan(
                        text: ' $email',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Constants.space,
              Constants.space,
              Constants.space,
              const ErrorMessage(
                message: '',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallText('didntrecieve'.tr),
                  GestureDetector(
                    onTap: () {
                      _authController.resendVerification(email: email);
                    },
                    child: Text(
                      'resend'.tr,
                      style: const TextStyle(
                        color: Color(0xff0095E9),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Constants.space,
              Constants.space,
              Button(
                text: 'openmail'.tr,
                onPressed: () async {
                  // Android: Will open mail app or show native picker.
                  // iOS: Will open mail app if single mail app found.
                  var result = await OpenMailApp.openMailApp();

                  // If no mail apps found, show error
                  if (!result.didOpen && !result.canOpen) {
                    // showNoMailAppsDialog(context);

                    // iOS: if multiple mail apps found, show dialog to select.
                    // There is no native intent/default app system in iOS so
                    // you have to do it yourself.
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                  Get.to(() => const Login());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
