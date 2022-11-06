import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/widgets/small_text.dart';
//import 'package:mhc_consumer/widgets/title_text.dart';

//import '../../../utils/constants.dart';
import '../../../util/constants.dart';
import '../../../widgets/small_text_widget.dart';
import '../../../widgets/title_text.dart';

class OnBoardingSuccess extends StatelessWidget {
  const OnBoardingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Constants.spaceLarge,
          Center(
            child: SvgPicture.asset(
              'assets/svgs/on_boarding_success.svg',
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Center(
            child: TitleText(
              'ready'.tr,
              fontSize: 24,
            ),
          ),
          Constants.spaceMedium,
          Center(
            child: SmallText(
              'readymessage'.tr,
              size: 14,
            ),
          ),
        ]),
      ),
    );
  }
}
