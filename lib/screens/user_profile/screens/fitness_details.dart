import 'package:settings_page/util/exports.dart';

class ProfileFitnessDetailsScreen extends StatelessWidget {
  const ProfileFitnessDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: CommonAppBAr(
              title: 'fitness_details'.tr,
            ),
            preferredSize: const Size.fromHeight(50)),
        body: SingleChildScrollView(
            child: Column(children: [
          Constants.spaceLarge,
          Constants.spaceLarge,
          CommonImageView(
              svgPath: 'assets/svgs/img_boostyourinmu_226X339.svg',
              height: 226,
              width: 339),
          Constants.spaceLarge,
          Constants.spaceMedium,
          Center(
              child: SizedBox(
            width: Get.size.width * 0.7,
            child: Text("msg_share_your_fitn".tr,
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.poppinsTextStyle(
                    color: Constants.fromHex('#34405E'),
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          )),
          Constants.spaceLarge,
          Button(
              width: Get.size.width * 0.65,
              text: "msg_add_fitness_det".tr.toUpperCase(),
              onPressed: () {})
        ])));
  }
}
