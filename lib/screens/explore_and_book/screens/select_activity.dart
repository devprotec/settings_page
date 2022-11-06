import 'package:settings_page/screens/explore_and_book/screens/search_professional.dart';
import 'package:settings_page/util/exports.dart';

import '../models/coach_filter_controller.dart';
import 'search_sport_place.dart';
import 'sport_places_event_programs.dart';

class SelectActivity extends StatefulWidget {
  final bool isOnline;
  final Explore explore;
  final String? buttonText;
  const SelectActivity({Key? key, required this.explore, this.buttonText, required this.isOnline})
      : super(key: key);

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  // SelectActivity({Key? key}) : super(key: key);
  final controller = Get.put(CoachFilterController());

  bool isMeditation = false;
  bool isYoga = false;
  bool isRunning = false;
  bool isStretching = false;
  bool isCardio = false;
  final activityImage = [
    'assets/svgs/meditation.svg',
    'assets/svgs/yoga.svg',
    'assets/svgs/stretching.svg',
    'assets/svgs/running.svg',
    'assets/svgs/cardio.svg',
    'assets/svgs/meditation.svg',
    'assets/svgs/yoga.svg',
    'assets/svgs/stretching.svg',
    'assets/svgs/running.svg',
    'assets/svgs/cardio.svg'
  ];

  onMeditationTap() {
    setState(() {
      if (controller.activities.contains("Meditation")) {
        controller.activities.remove("Meditation");
      } else {
        controller.activities.add("Meditation");
      }
    });
    // });
  }

  onRunningTap() {
    setState(() {
      if (controller.activities.contains("Running")) {
        controller.activities.remove("Running");
      } else {
        controller.activities.add("Running");
      }
    });
     
  }

  onStretchingTap() {
    setState(() {
      if (controller.activities.contains("Stretching")) {
        controller.activities.remove("Stretching");
      } else {
        controller.activities.add("Stretching");
      }
    });
     
  }

  onCardioTap() {
    setState(() {
      if (controller.activities.contains("Cardio")) {
        controller.activities.remove("Cardio");
      } else {
        controller.activities.add("Cardio");
      }
    });
     
  }

  onYogaTap() {
    setState(() {
      if (controller.activities.contains("Yoga")) {
        controller.activities.remove("Yoga");
      } else {
        controller.activities.add("Yoga");
      }
    });
     
  }

  onNextTap() {
    if (widget.explore == Explore.Coaches) {
      Get.to(() => SearchProfessional(title: "Select Coach",));
    } else if (widget.explore == Explore.SportPlaces) {
      Get.to(() => SportPlacesEventsPrograms(isOnline: widget.isOnline,));
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
            'select_activity'.tr,
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
              activityCard(controller.activities.contains("Meditation"),
                  'assets/svgs/meditation.svg', onMeditationTap),
              activityCard(controller.activities.contains("Yoga"), 'assets/svgs/yoga.svg', onYogaTap),
              activityCard(
                  controller.activities.contains("Stretching"), 'assets/svgs/stretching.svg', onStretchingTap),
              activityCard(controller.activities.contains("Running"), 'assets/svgs/running.svg', onRunningTap),
              activityCard(controller.activities.contains("Cardio"), 'assets/svgs/cardio.svg', onCardioTap),
              //showSearch(context: context, delegate: delegate)
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
