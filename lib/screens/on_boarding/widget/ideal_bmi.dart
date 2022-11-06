import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/global_controller.dart';
//import '../../../utils/constants.dart';
import '../../../util/constants.dart';

class IdealBMI extends GetView<GlobalController> {
  const IdealBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff00ACE9),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "idealbmi".tr,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
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
            Icons.star,
            color: Colors.white,
          ),
        ),
        Constants.spaceSmall,
        Text(
          '${controller.userProfile.value.profile?.idealBmi?.split(' ')[0]}',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Constants.spaceSmall,
        Text(
          'normalweight'.tr,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xffCDF1FF),
          ),
        ),
      ]),
    );
  }
}
