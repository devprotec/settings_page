import 'package:settings_page/util/exports.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  var onboardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("??? usertype ${onboardingController.usertype.value}");
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TitleText(
              'usertype'.tr,
            ),
            Obx(
              () => AnimatedCrossFade(
                  firstChild: ErrorMessage(
                    message: 'unanswered'.tr,
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: onboardingController.userTypeError.value &&
                          onboardingController.usertype.value.value ==
                              UserTypes.NONE
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserTypeCard(
                  image: 'usertype_customer.svg',
                  label: 'usertype_customer'.tr,
                  userType: UserTypes.CUSTOMER,
                ),
                UserTypeCard(
                  image: 'usertype_professional.svg',
                  label: 'usertype_professional'.tr,
                  userType: UserTypes.PROFESSIONAL,
                ),
              ],
            ),
            Constants.spaceMedium,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Constants.pColor.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    'customer'.tr,
                    textColor: const Color(0xff34405E),
                    weight: FontWeight.bold,
                  ),
                  SmallText(
                    'customer_desc'.tr,
                    textColor: const Color(0xff34405E),
                  ),
                ],
              ),
            ),
            Constants.spaceMedium,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Constants.accentPurple.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    'professional'.tr,
                    textColor: Constants.accentPurple,
                    weight: FontWeight.bold,
                  ),
                  SmallText(
                    'professional_desc'.tr,
                    textColor: Constants.accentPurple,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserTypeCard extends GetView<OnBoardingController> {
  final String label;
  final String image;
  final UserTypes userType;
  const UserTypeCard(
      {Key? key,
      required this.label,
      required this.image,
      required this.userType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.usertype.value.value = userType;
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.usertype.value.value != userType
                  ? Constants.mainColor.withOpacity(0.1)
                  : Constants.pColor,
              width: 1,
            ),
            color: const Color(0xffF4F5FB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svgs/$image',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SmallText(
                label,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
