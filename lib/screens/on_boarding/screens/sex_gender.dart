import 'package:settings_page/util/exports.dart';

class SexGender extends StatefulWidget {
  const SexGender({Key? key}) : super(key: key);

  @override
  State<SexGender> createState() => _SexGenderState();
}

class _SexGenderState extends State<SexGender> {
  var onboardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("??? sex ${onboardingController.sex.value}");
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TitleText(
              'dobtitle'.tr,
            ),
            Constants.spaceMedium,
            GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    maxTime: DateTime.now(),
                    currentTime: DateTime.now(), onChanged: (date) {
                  onboardingController.dob.value.value = Utilities.yearMD(date);
                }, onConfirm: (date) {
                  onboardingController.dob.value.value = Utilities.yearMD(date);
                }, locale: LocaleType.en);
              },
              child: Obx(
                () => InputForms(
                  obscure: false,
                  description: 'dob'.tr,
                  notifier: onboardingController.dob.value,
                  enabled: false,
                  placeholder: 'MM/DD/YYYY',
                  validation: FormBuilderValidators.compose([
                    if (onboardingController.sexError.value) ...[
                      FormBuilderValidators.required(errorText: 'required'.tr),
                    ]
                  ]),
                  // enabled: authController.isFormFieldsEnabled.value,
                  onChange: (val) {
                    onboardingController.dob.value.value = val!;
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.06),
            TitleText(
              'sex'.tr,
            ),
            Obx(
              () => AnimatedCrossFade(
                  firstChild: ErrorMessage(
                    message: 'unanswered'.tr,
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: onboardingController.sexError.value &&
                          onboardingController.sex.value.value == Genders.NONE
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SexCard(
                  image: 'male.svg',
                  label: 'male'.tr,
                  gender: Genders.M,
                ),
                SexCard(
                  image: 'female.svg',
                  label: 'female'.tr,
                  gender: Genders.F,
                ),
              ],
            ),
            Constants.spaceMedium,
          ],
        ),
      ),
    );
  }
}

class SexCard extends GetView<OnBoardingController> {
  final String label;
  final String image;
  final Genders gender;
  const SexCard(
      {Key? key,
      required this.label,
      required this.image,
      required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.sex.value.value = gender;
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.sex.value.value != gender
                  ? Constants.mainColor.withOpacity(0.1)
                  : Constants.pColor,
              width: 1,
            ),
            color: const Color(0xffF4F5FB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svgs/$image',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SmallText(
                label,
                size: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
