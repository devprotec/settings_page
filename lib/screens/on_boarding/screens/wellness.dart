import 'package:mhc_customer/util/exports.dart';

class Wellness extends GetView<OnBoardingController> {
  const Wellness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  'wellness'.tr,
                ),
                Constants.space,
                Obx(
                  () => AnimatedCrossFade(
                      firstChild: ErrorMessage(
                        message: 'unanswered'.tr,
                      ),
                      secondChild: const SizedBox(),
                      // ignore: invalid_use_of_protected_member
                      crossFadeState: controller.goalsError.value &&
                              controller.goals.isEmpty
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 400)),
                ),
              ],
            ),
          ),
          const ErrorMessage(message: ''),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: BubbleLens(
                size: 200,
                highRatio: 200,
                lowRatio: 100,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                widgets: [
                  for (var i = 0; i < wellnessGoals.length; i++) ...[
                    Bubble(
                      text: Utilities.enumToString(
                          (wellnessGoals[i % 6]['text'] as WELLNESS_GOALS)
                              .name),
                      image: wellnessGoals[i % 6]['image'],
                      value: wellnessGoals[i % 6]['value'] as WELLNESS_GOALS,
                    ),
                  ]
                ]),
          ),
        ],
      ),
    );
  }
}

List<dynamic> wellnessGoals = [
  {
    'text': WELLNESS_GOALS.GAIN_WEIGHT,
    'value': WELLNESS_GOALS.GAIN_WEIGHT,
    'image': 'gain',
  },
  {
    'text': WELLNESS_GOALS.LOSE_WEIGHT,
    'value': WELLNESS_GOALS.LOSE_WEIGHT,
    'image': 'lose',
  },
  // {
  //   'text':  WELLNESS_GOALS.GAIN_WEIGHT.name,
  //   'value': 'maintain',
  //   'image': 'reset',
  // },
  {
    'text': WELLNESS_GOALS.BE_MORE_ACTIVE,
    'value': WELLNESS_GOALS.BE_MORE_ACTIVE,
    'image': 'active',
  },
  // {
  //   'text': 'goal'.tr,
  //   'value': 'goal',
  //   'image': 'goal',
  // },
  {
    'text': WELLNESS_GOALS.EAT_HEALTHY,
    'value': WELLNESS_GOALS.EAT_HEALTHY,
    'image': 'goal',
  },
  // {
  //   'text': 'exercise'.tr,
  //   'value': 'exercise',
  //   'image': 'splash',
  // },
  {
    'text': WELLNESS_GOALS.KEEP_FIT_STAY_TONED,
    'value': WELLNESS_GOALS.KEEP_FIT_STAY_TONED,
    'image': 'splash',
  },
  {
    'text': WELLNESS_GOALS.REDUCE_STRESS,
    'value': WELLNESS_GOALS.REDUCE_STRESS,
    'image': 'welcome',
  },
];

enum WELLNESS_GOALS {
  LOSE_WEIGHT,
  GAIN_WEIGHT,
  BE_MORE_ACTIVE,
  KEEP_FIT_STAY_TONED,
  EAT_HEALTHY,
  REDUCE_STRESS,
}
