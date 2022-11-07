import 'package:mhc_customer/util/exports.dart';

class BloobType extends GetView<OnBoardingController> {
  const BloobType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          TitleText(
            'bloodtype'.tr,
          ),
          Constants.space,
          Obx(
            () => AnimatedCrossFade(
                firstChild: ErrorMessage(
                  message: 'addCertError'.tr,
                ),
                secondChild: const SizedBox(),
                crossFadeState: controller.bloodError.value &&
                        controller.bloodtype.value.isEmpty
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < bloodTypes.length - 4; i++)
                BloodDesign(
                  blood: bloodTypes[i],
                )
            ],
          ),
          Constants.spaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 4; i < bloodTypes.length; i++)
                BloodDesign(
                  blood: bloodTypes[i],
                )
            ],
          ),
          Constants.spaceMedium,
          Row(
            children: [
              Obx(
                () => Checkbox(
                    side: const BorderSide(
                      color: Color(0xff6E768D),
                    ),
                    value: controller.knowsBloodType.value,
                    onChanged: (val) {
                      controller.knowsBloodType.value = val!;
                    }),
              ),
              Expanded(
                child: SmallText(
                  'bloodignorance'.tr,
                ),
              ),
            ],
          ),
          Constants.spaceLarge,
          TitleText(
            'allergies'.tr,
          ),
          Constants.spaceSmall,
          Obx(
            () => AnimatedCrossFade(
                firstChild: ErrorMessage(
                  message: 'unanswered'.tr,
                ),
                secondChild: const SizedBox(),
                crossFadeState: controller.allergiesError.value &&
                        controller.allergies.value == Options.none
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
          ),
          Wrap(
            children: allAllergies
                .map(
                  (e) => SelectButtons(
                    label: e['label'] as String,
                    value: e['value'] as Options,
                    type: OptionsType.allergies,
                  ),
                )
                .toList(),
          ),
          Constants.spaceSmall,
          Obx(
            () => AnimatedCrossFade(
                firstChild: InputForms(
                  obscure: false,
                  description: 'Allegy',
                  notifier: controller.allergy.value,
                  validation: FormBuilderValidators.compose([
                    if (controller.allergiesError.value) ...[
                      FormBuilderValidators.required(errorText: 'required'.tr),
                    ]
                  ]),
                  inputType: TextInputType.emailAddress,
                  onChange: (val) {
                    controller.allergy.value.value = val!;
                  },
                ),
                secondChild: const SizedBox(),
                crossFadeState: controller.allergies.value == Options.yes
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
          ),
          Constants.spaceLarge,
          TitleText(
            'disease'.tr,
          ),
          Constants.spaceSmall,
          Obx(
            () => AnimatedCrossFade(
                firstChild: ErrorMessage(
                  message: 'unanswered'.tr,
                ),
                secondChild: const SizedBox(),
                crossFadeState: controller.diseaseError.value &&
                        controller.disease.value == Options.none
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
          ),
          Wrap(
            children: allAllergies
                .map(
                  (e) => SelectButtons(
                    label: e['label'] as String,
                    value: e['value'] as Options,
                    type: OptionsType.disease,
                  ),
                )
                .toList(),
          ),
          Constants.spaceSmall,
          Obx(
            () => AnimatedCrossFade(
                firstChild: InputForms(
                  obscure: false,
                  description: 'Disease',
                  notifier: controller.diseaseName.value,
                  validation: FormBuilderValidators.compose([
                    if (controller.diseaseError.value) ...[
                      FormBuilderValidators.required(errorText: 'required'.tr),
                    ]
                  ]),
                  inputType: TextInputType.emailAddress,
                  onChange: (val) {
                    controller.diseaseName.value.value = val!;
                  },
                ),
                secondChild: const SizedBox(),
                crossFadeState: controller.disease.value == Options.yes
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
          ),
          Constants.spaceLarge,
        ]),
      ),
    );
  }
}

// List<String> bloodTypes = [
//   'A+',
//   'A-',
//   'B+',
//   'B-',
//   'AB+',
//   'AB-',
//   'O+',
//   'O-',
// ];
List<Map> bloodTypes = [
  {'name': 'A+', 'value': BLOOD_GROUP.A_Positive},
  {'name': 'A-', 'value': BLOOD_GROUP.A_Negative},
  {'name': 'B+', 'value': BLOOD_GROUP.B_Positive},
  {'name': 'B-', 'value': BLOOD_GROUP.B_Negative},
  {'name': 'AB+', 'value': BLOOD_GROUP.AB_Positive},
  {'name': 'AB-', 'value': BLOOD_GROUP.AB_Negative},
  {'name': 'O+', 'value': BLOOD_GROUP.O_Positive},
  {'name': 'O-', 'value': BLOOD_GROUP.O_Negative},
];

enum BLOOD_GROUP {
  AB_Positive,
  AB_Negative,
  A_Positive,
  A_Negative,
  B_Positive,
  B_Negative,
  O_Positive,
  O_Negative,
}

var allAllergies = [
  {
    'label': 'yes'.tr,
    'value': Options.yes,
  },
  {
    'label': 'no'.tr,
    'value': Options.no,
  },
  {
    'label': 'dontknow'.tr,
    'value': Options.dontKnow,
  },
];
