import 'package:settings_page/util/exports.dart';

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
