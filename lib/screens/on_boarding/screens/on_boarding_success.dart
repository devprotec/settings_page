import 'package:mhc_customer/util/exports.dart';

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
