import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/screens/on_boarding/widget/bmi_info_card.dart';
//import 'package:mhc_consumer/utils/constants.dart';

import '../../../controllers/onboarding_controller.dart';
import '../../../../widgets/title_text.dart';
import '../../../util/constants.dart';
import '../widget/bmi_info_card.dart';
import '../widget/ideal_bmi.dart';
import '../widget/recommendation_card.dart';
import '../widget/your_bmi.dart';

class Summary extends GetView<OnBoardingController> {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: ListView(children: [
        TitleText(
          'summary'.tr,
        ),
        Constants.spaceLarge,
        const BMIinfoCard(),
        Constants.spaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(flex: 3, child: YourBMI()),
            SizedBox(
              width: 20,
            ),
            Expanded(flex: 4, child: IdealBMI()),
          ],
        ),
        Constants.spaceLarge,
        const RecommendationCard(),
        Constants.spaceLarge,
      ]),
    );
  }
}
