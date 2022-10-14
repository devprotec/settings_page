import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:settings_page/screens/user_profile/widgets/select_button.dart';

import '../../../util/constants.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/form_widget.dart';
import '../../../widgets/small_text_widget.dart';
import '../../../widgets/title_text.dart';
import '../models/onboarding_controller.dart';
import 'blood_shape.dart';

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
                  text: bloodTypes[i],
                )
            ],
          ),
          Constants.spaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 4; i < bloodTypes.length; i++)
                BloodDesign(
                  text: bloodTypes[i],
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

List<String> bloodTypes = [
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-',
];

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
