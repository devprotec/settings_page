import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/screens/on_boarding/widget/select_button.dart';

import '../../../controllers/onboarding_controller.dart';
//import '../../../utils/constants.dart';
import '../../../../widgets/title_text.dart';
import '../../../util/constants.dart';
import '../model/options.dart';
import '../widget/ruler.dart';
import '../widget/select_button.dart';

class HeightWeight extends GetView<OnBoardingController> {
  const HeightWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    Get.put(OnBoardingController());
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: ListView(children: [
        TitleText(
          'weight'.tr,
        ),
        Constants.space,
        Wrap(
          children: weightOptions
              .map(
                (e) => SelectButtons(
                  label: e['label'] as String,
                  value: e['value'] as Options,
                  type: OptionsType.weight,
                ),
              )
              .toList(),
        ),
        Constants.spaceSmall,
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Obx(
              () => Center(
                child: Ruler(
                  onValueChange: (val) {
                    controller.weightVal.value = val;
                  },
                  begin: controller.weight.value == Options.kg ? 3.0 : 0.0,
                  currentValue:
                      controller.weight.value == Options.kg ? 62.0 : 130.0,
                  end: controller.weight.value == Options.kg ? 422.0 : 1000.0,
                ),
              ),
            )),
        Constants.spaceLarge,
        TitleText(
          'height'.tr,
        ),
        Constants.spaceSmall,
        Wrap(
          children: heightOptions
              .map(
                (e) => SelectButtons(
                  label: e['label'] as String,
                  value: e['value'] as Options,
                  type: OptionsType.height,
                ),
              )
              .toList(),
        ),
        Constants.spaceSmall,
        Obx(() => SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Ruler(
                  onValueChange: (val) {
                    controller.heightVal.value = val;
                  },
                  begin: controller.height.value == Options.cm ? 30.0 : 30.0,
                  currentValue:
                      controller.height.value == Options.cm ? 160.0 : 50.0,
                  end: controller.height.value == Options.cm ? 422.0 : 100.0,
                  hasDecimal: controller.height.value != Options.cm,
                ),
              ),
            )),
        Constants.spaceSmall,
        Constants.spaceLarge,
      ]),
    );
  }
}

var heightOptions = [
  {
    'label': 'cm'.tr,
    'value': Options.cm,
  },
  {
    'label': 'ft in'.tr,
    'value': Options.ft,
  },
];
var weightOptions = [
  {
    'label': 'kg'.tr,
    'value': Options.kg,
  },
  {
    'label': 'Ib'.tr,
    'value': Options.ib,
  },
];
