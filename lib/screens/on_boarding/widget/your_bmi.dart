import 'package:settings_page/util/exports.dart';

class YourBMI extends GetView<GlobalController> {
  const YourBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffCDF1FF),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "yourbmi".tr,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff022364),
          ),
        ),
        Constants.spaceMedium,
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff0085C8),
          ),
          child: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white,
          ),
        ),
        Constants.spaceSmall,
        Text(
          '${controller.userProfile.value.profile?.currentBmi?.split(' ')[0]}',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Constants.spaceSmall,
        Text(
          'obesity'.tr,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff0085C8),
          ),
        ),
      ]),
    );
  }
}
