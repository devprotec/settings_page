import 'package:settings_page/util/exports.dart';

class SelectActivity extends StatefulWidget {
  const SelectActivity({Key? key}) : super(key: key);

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  // SelectActivity({Key? key}) : super(key: key);
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
      isMeditation = !isMeditation;
    });
    // });
  }

  onRunningTap() {
    setState(() {
      isRunning = !isRunning;
    });
  }

  onStretchingTap() {
    setState(() {
      isStretching = !isStretching;
    });
  }

  onCardioTap() {
    setState(() {
      isCardio = !isCardio;
    });
  }

  onYogaTap() {
    setState(() {
      isYoga = !isYoga;
    });
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
            text: 'lbl_next'.tr,
            onPressed: () {},
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
              activityCard(
                  isMeditation, 'assets/svgs/meditation.svg', onMeditationTap),
              activityCard(isYoga, 'assets/svgs/yoga.svg', onYogaTap),
              activityCard(
                  isStretching, 'assets/svgs/stretching.svg', onStretchingTap),
              activityCard(isRunning, 'assets/svgs/running.svg', onRunningTap),
              activityCard(isCardio, 'assets/svgs/cardio.svg', onCardioTap),
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
