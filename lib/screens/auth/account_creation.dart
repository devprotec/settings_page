import 'package:settings_page/util/exports.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({Key? key}) : super(key: key);

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final password = ValueNotifier<String>('');
  final email = ValueNotifier<String>('');
  var authController = Get.put(AuthController());
  final _globalController = Get.put(GlobalController());

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

    return Scaffold(
      backgroundColor: Colors.white,
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
              child: Center(child: TitleText('createaccount'.tr)),
            ),
            Constants.space,
            Constants.space,
            Constants.space,
            Obx(() => InputForms(
                  obscure: false,
                  description: 'email'.tr,
                  notifier: email,
                  validation: FormBuilderValidators.compose([
                    if (authController.hasError.value) ...[
                      FormBuilderValidators.required(errorText: 'required'.tr),
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
                  description: 'createpassword'.tr,
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
                      FormBuilderValidators.required(errorText: 'required'.tr),
                      FormBuilderValidators.minLength(8,
                          errorText:
                              'This password is too short. It must contain at least 8 characters.'),
                    ]
                  ]),
                  onChange: (val) {
                    password.value = val!;
                  },
                )),
            Constants.space,
            const ErrorMessage(message: ''),
            Row(
              children: [
                Checkbox(
                    side: const BorderSide(
                      color: Color(0xff6E768D),
                    ),
                    value: checkedValue,
                    onChanged: (val) {
                      if (val!) {
                        _globalController.hasError.value = false;
                        _globalController.errorMessage.value = '';
                      } else {
                        _globalController.hasError.value = true;
                        _globalController.errorMessage.value =
                            'Please accept terms and condition';
                      }
                      setState(() {
                        checkedValue = val;
                      });
                    }),
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SmallText('agreement'.tr),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'policy'.tr,
                          style: const TextStyle(
                            color: Color(0xff0095E9),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SmallText(
                        ' & ',
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'terms'.tr,
                          style: const TextStyle(
                            color: Color(0xff0095E9),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Constants.space,
            Button(
              text: 'createaccount'.tr,
              onPressed: () {
                if (checkedValue) {
                  if (email.value.isNotEmpty &&
                      password.value.isNotEmpty &&
                      password.value.length > 7 &&
                      GetUtils.isEmail(email.value.trim())) {
                    var data = {
                      'email': email.value.trim(),
                      'password': password.value.trim(),
                    };

                    authController.register(data: data);
                  } else {
                    authController.hasError.value = true;
                  }
                } else {
                  _globalController.hasError.value = true;
                  _globalController.errorMessage.value =
                      'Please accept terms and condition';
                }
              },
            ),
            Constants.space,
            Center(child: SmallText('continue'.tr)),
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
                SmallText('haveaccount'.tr),
                GestureDetector(
                  onTap: () {
                    Get.to(const Login());
                  },
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
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
