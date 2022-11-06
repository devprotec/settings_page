import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:settings_page/screens/on_boarding/screens/sex_gender.dart';
import 'package:settings_page/screens/on_boarding/screens/wellness.dart';

import '../../../controllers/onboarding_controller.dart';
import '../../user_profile/widgets/blood_type.dart';
import '../../user_profile/widgets/height_weight.dart';
import '../../../util/constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/small_text_widget.dart';
import '../widget/indicator.dart';
import 'blood_type.dart';
import 'contact.dart';
import 'on_boarding_success.dart';
import 'summary.dart';
import 'user_type.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // actions: [
          //   TextButton(
          //     onPressed: () {},
          //     child: SmallText(
          //       'skip'.tr,
          //       size: 14,
          //     ),
          //   )
          // ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              controller.prev();
            },
          ),
          title: Obx(
            () => SmallText(
              '${controller.transition.value + 1}/${views.length}',
              size: 16,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < views.length; i++) ...[
                    Obx(
                      () => Indicator(
                        index: i,
                        total: views.length,
                        currentPage: controller.transition.value,
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController.value,
                    onPageChanged: ((value) =>
                        controller.transition.value = value),
                    itemBuilder: (context, index) {
                      return views[index];
                    }),
              ),
              AnimatedCrossFade(
                firstChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Button(
                        text: controller.transition.value >= 5
                            ? 'done'.tr
                            : 'next'.tr,
                        onPressed: () {
                          // controller.next();
                          controller.validation();
                        }),
                  ),
                ),
                secondChild: const SizedBox(),
                crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400),
              ),
              Constants.spaceLarge,
              Constants.spaceSmall
            ],
          ),
        ));
  }
}

List<Widget> views = [
  const Contact(),
  const SexGender(),
  //const UserType(),
  const BloobType(),
  const HeightWeight(),
  const Wellness(),
  const Summary(),
  //const OnBoardingSuccess(),
];
