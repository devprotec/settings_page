import 'package:mhc_customer/util/exports.dart';

class VerifyAccount extends StatefulWidget {
  final String email;
  const VerifyAccount({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  TextEditingController controller = TextEditingController();
  bool error = false;
  String errorMessage = '';
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              SizedBox(height: size.height * 0.05),
              CustomAppBar(
                text: "verifyaccount".tr,
                function: () {
                  Get.back();
                },
              ),
              AnimatedCrossFade(
                  firstChild: SvgPicture.asset(
                    'assets/svgs/verify_account.svg',
                    height: size.height * 0.38,
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),
              Text.rich(
                TextSpan(
                  text: '',
                  style: const TextStyle(
                    color: Color(0xff6E768D),
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'mailverification'.tr,
                    ),
                    TextSpan(
                        text: ' ${widget.email}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Constants.space,
              error
                  ? ErrorMessage(
                      message: errorMessage,
                    )
                  : Constants.space,
              Constants.space,
              PinField(
                controller: controller,
              ),
              Constants.space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallText('didntrecieve'.tr),
                  GestureDetector(
                    onTap: () {
                      // Get.to(const AccountCreation());
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
                text: 'verify',
                onPressed: () {
                  print(controller.text);
                  if (controller.text.isEmpty) {
                    setState(() {
                      errorMessage = "This field cannot be empty";
                      error = true;
                    });
                  } else if (controller.text != "1111") {
                    setState(() {
                      errorMessage =
                          "The code you entered is incorrect, try again";
                      error = true;
                    });
                  } else {
                    Get.to(const ChangePassword());
                    setState(() {
                      errorMessage = "";
                      error = false;
                    });
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
