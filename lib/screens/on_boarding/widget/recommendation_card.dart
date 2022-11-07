import 'package:settings_page/util/exports.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GlobalController());

    return PhysicalModel(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      color: Constants.pColor.withOpacity(0.1),
      shadowColor: Constants.pColor.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'recommendation'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Constants.spaceMedium,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SmallText(
                          '${controller.userProfile.value.profile?.dailyCalorieIntake?.split(' ')[0]}',
                          size: 32,
                          textColor: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmallText(
                            'kcal'.tr,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Constants.pColor.withOpacity(0.2),
                child: Center(
                  child: Icon(
                    Icons.flash_on,
                    color: Constants.pColor,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          Constants.spaceMedium,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants.pColor.withOpacity(0.1),
            ),
            child: SmallText(
              'recommendationMessage'.tr,
              textColor: const Color(0xff34405E),
            ),
          )
        ]),
      ),
    );
  }
}
