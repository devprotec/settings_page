import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/shared_controllers/onboarding_controller.dart';
//import 'package:mhc_consumer/utils/constants.dart';
//import 'package:mhc_consumer/widgets/error_message.dart';
//import '../../../widgets/forms.dart';
//import '../../../widgets/small_text.dart';
import '../../../../widgets/title_text.dart';
import '../../user_profile/models/onboarding_controller.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../util/constants.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/form_widget.dart';
import '../../../widgets/small_text_widget.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Widget countryPicker = const SizedBox();
  var controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TitleText(
              'contactDetails'.tr,
            ),
            Constants.spaceSmall,
            SmallText('contactInfo'.tr),
            Constants.spaceLarge,
            Obx(
              () => InputForms(
                obscure: false,
                description: 'firstname'.tr,
                notifier: controller.fname.value,
                validation: FormBuilderValidators.compose([
                  if (controller.contactError.value) ...[
                    FormBuilderValidators.required(errorText: 'required'.tr),
                  ]
                ]),
                // enabled: authController.isFormFieldsEnabled.value,
                onChange: (val) {
                  controller.fname.value.value = val!;
                },
              ),
            ),
            Obx(
              () => InputForms(
                obscure: false,
                description: 'lastname'.tr,
                notifier: controller.lname.value,
                validation: FormBuilderValidators.compose([
                  if (controller.contactError.value) ...[
                    FormBuilderValidators.required(errorText: 'required'.tr),
                  ]
                ]),
                // enabled: authController.isFormFieldsEnabled.value,
                onChange: (val) {
                  controller.lname.value.value = val!;
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "phone".tr,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff34405E),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.35,
                      height: size.height * 0.06,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffF4F5FB),
                      ),
                      child: CountryCodePicker(
                          onChanged: (val) {
                            print(val);
                            controller.countryCode.value = val.dialCode!;
                            print("__ ${val.dialCode}");
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'GH',
                          favorite: const ['+233', 'GH'],
                          countryFilter: const [],
                          showFlagDialog: true,
                          showDropDownButton: true,
                          flagWidth: 25,
                          padding: EdgeInsets.zero,
                          // textStyle: const TextStyle(
                          //   fontSize: 10,
                          //   color: Colors.black,
                          // ),
                          dialogSize: Size(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height * 0.9,
                          ),

                          // comparator: (a, b) => b.name.compareTo(a.name),
                          //Get the country information relevant to the initial selection
                          onInit: (code) {
                            print(code);
                            controller.countryCode.value = code!.dialCode!;
                            print("__init ${code.dialCode}");
                          }),
                    ),
                    Expanded(
                      child: Obx(
                        () => InputForms(
                          obscure: false,
                          notifier: controller.phone.value,
                          inputType: TextInputType.number,
                          validation: FormBuilderValidators.compose([
                            if (controller.contactError.value) ...[
                              FormBuilderValidators.required(
                                  errorText: 'required'.tr),
                              FormBuilderValidators.numeric(
                                  errorText: 'Invalid Phone Number')
                            ]
                          ]),
                          // enabled: authController.isFormFieldsEnabled.value,
                          onChange: (val) {
                            controller.phone.value.value = val!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const ErrorMessage(message: ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
