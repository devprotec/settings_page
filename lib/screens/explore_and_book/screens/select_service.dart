import 'package:mhc_customer/util/exports.dart';

class SelectService extends StatefulWidget {
  final Explore explore;
  final String? buttonText;
  const SelectService({Key? key, required this.explore, this.buttonText})
      : super(key: key);

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  // SelectActivity({Key? key}) : super(key: key);
  final controller = Get.put(CoachFilterController());

  bool isMeditation = false;
  bool isYoga = false;
  bool isRunning = false;
  bool isStretching = false;
  bool isCardio = false;

  onMeditationTap() {
    setState(() {
      if (controller.services.contains("Meditation")) {
        controller.services.remove("Meditation");
      } else {
        controller.services.add("Meditation");
      }
    });
    // });
  }

  onCoachingTap() {
    setState(() {
      if (controller.services.contains("Coaching")) {
        controller.services.remove("Coaching");
      } else {
        controller.services.add("Coaching");
      }
    });
  }

  onLoseWeightTap() {
    setState(() {
      if (controller.services.contains("LoseWeight")) {
        controller.services.remove("LoseWeight");
      } else {
        controller.services.add("LoseWeight");
      }
    });
  }

  onGainWeight() {
    setState(() {
      if (controller.services.contains("GainWeight")) {
        controller.services.remove("GainWeight");
      } else {
        controller.services.add("GainWeight");
      }
    });
  }

  onConsultationTap() {
    setState(() {
      if (controller.services.contains("Consultation")) {
        controller.services.remove("Consultation");
      } else {
        controller.services.add("Consultation");
      }
    });
  }

  onPersonalDietTap() {
    setState(() {
      if (controller.services.contains("PersonalDiet")) {
        controller.services.remove("PersonalDiet");
      } else {
        controller.services.add("PersonalDiet");
      }
    });
  }

  onNextTap() {
    if (widget.explore == Explore.Coaches) {
      Get.to(() => SearchProfessional(title: "Select Wellness Professional"));
    } else if (widget.explore == Explore.SportPlaces) {
      Get.to(() => SportPlacesEventsPrograms(
            isOnline: false,
          ));
    } else if (widget.explore == Explore.None) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Constants.arrowBacks(color: Colors.black),
          title: Text(
            'Select Service'.tr,
            style: Constants.titleTextStyle,
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Button(
            text: widget.buttonText ?? 'lbl_next'.tr,
            onPressed: () {
              onNextTap();
            },
            width: double.infinity,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              activityCard(controller.services.contains("PersonalDiet"),
                  'assets/svgs/personal_diet.svg', onPersonalDietTap),
              activityCard(controller.services.contains("Consultation"),
                  'assets/svgs/consultation.svg', onConsultationTap),
              activityCard(controller.services.contains("GainWeight"),
                  'assets/svgs/gaining_weight.svg', onGainWeight),
              activityCard(controller.services.contains("LoseWeight"),
                  'assets/svgs/loosing_weight.svg', onLoseWeightTap),
              activityCard(controller.services.contains("Coaching"),
                  'assets/svgs/coaching.svg', onCoachingTap),
              activityCard(controller.services.contains("Meditation"),
                  'assets/svgs/meditation.svg', onMeditationTap),
            ],
          ),
        ),
      ),
    );
  }

  activityCard(
    bool isSelected,
    String activityImage,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected
          ? Container(
              child: Stack(
                children: [
                  CommonImageView(
                    svgPath: activityImage,
                  ),
                  Container(
                    height: 174,
                    width: 156,
                    decoration: BoxDecoration(
                      color: Constants.fromHex('#161B46').withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CommonImageView(
                      svgPath: 'assets/svgs/check.svg',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : CommonImageView(
              svgPath: activityImage,
            ),
    );
  }
}
