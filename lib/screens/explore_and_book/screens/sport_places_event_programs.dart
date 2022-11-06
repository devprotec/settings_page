import 'package:settings_page/screens/explore_and_book/screens/coach_details.dart';
import 'package:settings_page/screens/explore_and_book/widgets/professionalcard.dart';
import 'package:settings_page/screens/explorer_booker/location_details_screen.dart';
import 'package:settings_page/widgets/programs_card.dart';

import '../../../models/professional_data_model.dart';
import '../../../util/exports.dart';
import 'sport_places_filter.dart';

class SportPlacesEventsPrograms extends StatefulWidget {
  final bool isOnline;
  const SportPlacesEventsPrograms({Key? key, required this.isOnline})
      : super(key: key);

  @override
  State<SportPlacesEventsPrograms> createState() =>
      _SportPlacesEventsProgramsState();
}

class _SportPlacesEventsProgramsState extends State<SportPlacesEventsPrograms> {
  int currentTab = 0;
  final eventsList = <EventDataModel>[event1, event2, event3, event4, event5, event6];
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Coaches'),
    const Tab(text: 'Programs'),
    const Tab(text: 'Events'),
  ];

  var organizerList = <ProfesionalDataModel>[
    cooper,
    nancy,
    stefany,
    guy,
    amelia,
    david,
    anthony,
    oswald,
    simon,
    bright
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.isOnline ? 60 : 80),
          child: Stack(
            children: [
              CommonImageView(
                svgPath: 'assets/svgs/base_1.svg',
              ),
              widget.isOnline
                  ? AppbarWidget(
                      appBarTitle: "Online Classes",
                      hasActions: true,
                      trailingWidget: GestureDetector(
                          onTap: () {
                            Get.to(() => SportPlacesFilter());
                          },
                          child: Icon(Icons.filter_list)),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 14.0, left: 5),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.black,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          CommonImageView(
                            height: 40,
                            width: 40,
                            imagePath: "assets/images/img_halo_logo.png",
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hallo Sport Gym",
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Constants.fromHex('#0E1339'),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.5",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '212',
                                    style: Constants.inactiveSubtitleTextStyle,
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 15,
                                    width: 1,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => LocationDetailsScreen());
                                    },
                                    child: Text(
                                      'Details',
                                      style: AppStyle.poppinsTextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Constants.pColor),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              widget.isOnline
                  ? SizedBox.shrink()
                  : Positioned.fill(
                      top: 18,
                      left: size.width * 0.85,
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => SportPlacesFilter());
                        },
                        icon: Icon(Icons.filter_list),
                      ),
                    ),
            ],
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Column(
            children: [
              Constants.spaceMediumColumn,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTabs(
                  tabs: tabs,
                  switchTab: (index) {
                    setState(() {
                      currentTab = index;
                    });
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 12,
                    right: 12,
                  ),
                  child: currentTab == 0
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: organizerList.length == 0
                              ? 1
                              : organizerList.length,
                          itemBuilder: ((context, index) {
                            return organizerList.length == 0
                                ? Constants.emptyEvents()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 5),
                                    child: NewProfessionalCard(
                                      profesionalDataModel:
                                          organizerList[index],
                                      isCard: true,
                                    ),
                                  );
                          }),
                        )
                      : currentTab == 1
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: eventsList.length == 0
                                  ? 1
                                  : eventsList.length,
                              itemBuilder: ((context, index) {
                                return eventsList.length == 0
                                    ? Constants.emptyEvents()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 5),
                                        child: eventsList[index].programType ==
                                                "Program"
                                            ? ProgramCard(
                                                eventDataModel:
                                                    eventsList[index],
                                              )
                                            : SizedBox.shrink(),
                                      );
                              }),
                            )
                          : currentTab == 2
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: eventsList.length == 0
                                      ? 1
                                      : eventsList.length,
                                  itemBuilder: ((context, index) {
                                    return eventsList.length == 0
                                        ? Constants.emptyEvents()
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 5),
                                            child:
                                                eventsList[index].programType ==
                                                        "Event"
                                                    ? ProgramCard(
                                                        eventDataModel:
                                                            eventsList[index],
                                                      )
                                                    : SizedBox.shrink(),
                                          );
                                  }),
                                )
                              : SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
