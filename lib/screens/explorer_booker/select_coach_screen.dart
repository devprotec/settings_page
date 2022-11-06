import 'package:settings_page/screens/explorer_booker/models/program_details_model.dart';
import 'package:settings_page/screens/explorer_booker/models/sports_places_model.dart';
import 'package:settings_page/util/exports.dart';
import 'package:settings_page/widgets/ratings_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectCoachScreen extends StatefulWidget {
  @override
  State<SelectCoachScreen> createState() => _SelectCoachScreenState();
}

class _SelectCoachScreenState extends State<SelectCoachScreen> {
  int currentTab = 0;
  int activeSportsPlace = 0;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Classes'),
    const Tab(text: 'Programs'),
    const Tab(text: 'Events'),
  ];

  List activities = [
    "Meditation",
    "Runinng",
    "Dancing",
    "Hoping",
    "Yoga",
    "Cycling",
    "Stretching"
  ];
  List availability = [
    "Online",
    "In Sport Place",
  ];

  List classDurations = ['30 min', '1 hour', '1.5 hours', '2 hours'];
  List availableTimes = [
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "12:00",
    "13:00",
    "13:30",
    "14:30",
    "15:00",
    "17:00",
    "18:30",
    "19:00",
    "19:30"
  ];

  List sportPlaces = [
    SportsPlaces(
      logoAsset: "assets/images/img_halo_logo.png",
      sportPlaceName: "Halo Salt Gym",
      sportPlaceDistance: "1.5km",
      sportPlaceLocation: "6391 Elgin St. Celina, Delaware 1029",
      sportPlaceNumberOfReviews: 16,
      numberOfRatings: 4.0,
    ),
    SportsPlaces(
      logoAsset: "assets/images/img_halo_logo.png",
      sportPlaceName: "Matrix Gym",
      sportPlaceDistance: "0.5km",
      sportPlaceLocation: "14 UPSA St. Legon",
      sportPlaceNumberOfReviews: 2,
      numberOfRatings: 5.0,
    ),
    SportsPlaces(
      logoAsset: "assets/images/img_halo_logo.png",
      sportPlaceName: "Madina Kokompe",
      sportPlaceDistance: "2.1km",
      sportPlaceLocation: "Madina Market St.",
      sportPlaceNumberOfReviews: 5,
      numberOfRatings: 1.0,
    ),
  ];

  List programListOnline = [
    ProgramDetails(
        programTitle: "Losing Weight",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
    ProgramDetails(
        programTitle: "Losing Weight",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
    ProgramDetails(
        programTitle: "Losing Weight",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
  ];

  List programListInPerson = [
    ProgramDetails(
        programTitle: "Group Yoga",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
    ProgramDetails(
        programTitle: "Losing Weight",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
    ProgramDetails(
        programTitle: "Losing Weight",
        programPrice: "\$350",
        programTags: "Yoga, Meditation",
        programDescription: "Nutrition plan,  1 consultation",
        programDays: "Mon, Wed, Fri"),
  ];

  int activityIndex = 0;
  int availabilityIndex = 0;
  int classDurationIndex = 0;
  int availableTimesIndex = 0;
  int activeTag = 0;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.20238),
        child: Stack(
          children: [
            CommonImageView(
              svgPath: "assets/images/img_profile_back.svg",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 46.0, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jane Cooper',
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Constants.gray900,
                        ),
                      ),
                      Container(
                        height: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IgnorePointer(
                              child: RatingsWidget(
                                starColor: Constants.lightgray900,
                                starWidth: 12,
                                starHeight: 12,
                                numberOfStars: 1,
                                itemSize: 10,
                              ),
                            ),
                            SizedBox(
                              width: 5.66,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Row(
                                children: [
                                  Text(
                                    '5.0',
                                    style: AppStyle.poppinsTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Constants.lightgray900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '212',
                                    style: AppStyle.poppinsTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromRGBO(2, 35, 100, 0.65)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: height * 0.1679),
              child: CustomTabs(
                tabs: tabs,
                switchTab: (index) {
                  setState(() {
                    currentTab = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: currentTab == 0
            ? classContent()
            : currentTab == 1
                ? _programContent()
                : Container(),
      ),
    );
  }

  Widget classContent() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerText("Activity"),
                SizedBox(
                  height: 8,
                ),
                _listView(activities, activityIndex),
                SizedBox(
                  height: 24,
                ),
                _headerText("Availability"),
                SizedBox(
                  height: 8,
                ),
                _listView(availability, availabilityIndex),
                SizedBox(
                  height: 24,
                ),
                _headerText('Sports Places'),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: Get.height * 0.17491,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: sportPlaces.length,
                    itemBuilder: (_, index) {
                      return _sportsPlacesContainerView(index);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20),
                  child: Container(
                    width: Get.width,
                    height: 1.0,
                    color: Constants.horizontalLineColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    rowHeight: 32,
                    calendarFormat: _calendarFormat,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      /* leftChevronVisible: false,
                    rightChevronVisible: false, */
                      leftChevronPadding: EdgeInsets.zero,
                      leftChevronMargin: EdgeInsets.zero,
                      rightChevronPadding: EdgeInsets.zero,
                      rightChevronMargin: EdgeInsets.zero,
                      titleTextStyle: AppStyle.poppinsTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Constants.gray900,
                      ),
                    ),
                    daysOfWeekHeight: 24,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Constants.fromHex("#0E1339"),
                      ),
                      weekendStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Constants.fromHex("#0E1339"),
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      todayTextStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.lightBlue500),
                      withinRangeDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.inactiveStatusColorGray,
                      ),
                      defaultTextStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Constants.fromHex("#454E90"),
                      ),
                      outsideTextStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Constants.fromHex("#AEB2BF"),
                      ),
                      weekendTextStyle: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Constants.fromHex("#454E90"),
                      ), //#F4F5FB
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.inactiveStatusColorGray,
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.inactiveStatusColorGray,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width,
                  child: _calendarFormat == CalendarFormat.week
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _calendarFormat = CalendarFormat.month;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _calendarFormat = CalendarFormat.week;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                          ),
                        ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 24.0, left: 20, right: 20, top: 12),
                  child: Container(
                    width: Get.width,
                    height: 1.0,
                    color: Constants.horizontalLineColor,
                  ),
                ),
                _headerText('Class Duration'),
                SizedBox(
                  height: 8,
                ),
                _listView(classDurations, classDurationIndex),
                SizedBox(
                  height: 24,
                ),
                _headerText('Start Time'),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: availableTimes.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 32,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            availableTimesIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == availableTimesIndex
                                ? Constants.fromHex("#D4D9F5")
                                : Constants.fromHex("#F4F5FB"),
                          ),
                          child: Center(
                            child: Text(
                              availableTimes[index],
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: index == availableTimesIndex
                                    ? Constants.fromHex("#454E90")
                                    : Constants.fromHex("#6E768D"),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 25,
          child: Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Constants.lightBlue90019,
                          spreadRadius: getHorizontalSize(
                            2.00,
                          ),
                          blurRadius: getHorizontalSize(
                            2.00,
                          ),
                          offset: Offset(
                            0,
                            2,
                          ),
                        ),
                      ],
                    ),
                    child: Icon(Icons.favorite_outline),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Constants.lightBlue500,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Constants.lightBlue90019,
                            spreadRadius: getHorizontalSize(
                              2.00,
                            ),
                            blurRadius: getHorizontalSize(
                              2.00,
                            ),
                            offset: Offset(
                              0,
                              2,
                            ),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CONFIRM',
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$34',
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _listView(List listItems, int itemIndex) {
    return Container(
      height: 32,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20),
        shrinkWrap: true,
        itemCount: listItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              listItems == activities
                  ? setState(() {
                      activityIndex = index;
                    })
                  : listItems == availability
                      ? setState(() {
                          availabilityIndex = index;
                        })
                      : setState(() {
                          classDurationIndex = index;
                        });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == itemIndex
                      ? Constants.fromHex("#D4D9F5")
                      : Constants.fromHex("#F4F5FB"),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Text(
                    listItems[index],
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: index == itemIndex
                          ? Constants.fromHex("#454E90")
                          : Constants.fromHex("#6E768D"),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _headerText(String heading) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        heading,
        style: AppStyle.poppinsTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constants.lightgray900,
        ),
      ),
    );
  }

  _sportsPlacesContainerView(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeSportsPlace = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          width: 295,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: index == activeSportsPlace
                  ? Colors.white
                  : Constants.fromHex("#F9FCFF"),
              border: Border.all(
                color: index == activeSportsPlace
                    ? Constants.lightBlue500
                    : Constants.fromHex("#E6E8F3"),
                width: 1.0,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CommonImageView(
                      imagePath: sportPlaces[index].logoAsset,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 209,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sportPlaces[index].sportPlaceName,
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Constants.bluegray900,
                                ),
                              ),
                              Visibility(
                                visible: activeSportsPlace == index,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Constants.lightBlue500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IgnorePointer(
                              child: Container(
                                child: RatingsWidget(
                                  starColor: Constants.lightBlue500,
                                  starWidth: 12,
                                  starHeight: 12,
                                  numberOfStars: 5,
                                  itemSize: 10,
                                  initialRating:
                                      sportPlaces[index].numberOfRatings,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.66,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Row(
                                children: [
                                  Text(
                                    (sportPlaces[index].numberOfRatings)
                                        .toString(),
                                    style: AppStyle.poppinsTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Constants.lightgray900,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      height: 12,
                                      width: 1,
                                      color: Constants.horizontalLineColor,
                                    ),
                                  ),
                                  Text(
                                    sportPlaces[index]
                                            .sportPlaceNumberOfReviews
                                            .toString() +
                                        " reviews",
                                    style: AppStyle.poppinsTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Constants.bluegray504,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      sportPlaces[index].sportPlaceLocation,
                      style: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Constants.bluegray504,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 12,
                        width: 1,
                        color: Constants.horizontalLineColor,
                      ),
                    ),
                    Text(
                      sportPlaces[index].sportPlaceDistance,
                      style: AppStyle.poppinsTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Constants.lightgray900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _programContent() {
    List headerTags = ["All", "In Sports Place", "Online"];
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Container(
            width: Get.width,
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: headerTags.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTag = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeTag = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == activeTag
                              ? Constants.fromHex("#D4D9F5")
                              : Constants.fromHex("#F4F5FB"),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: Text(
                            headerTags[index],
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: index == activeTag
                                  ? Constants.fromHex("#454E90")
                                  : Constants.fromHex("#6E768D"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Offstage(
                    offstage: activeTag == 2,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CommonImageView(
                                    svgPath: "assets/images/icon_prog_loc.svg",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Halo Salt Gym, 6391 Elgin St. Celina...',
                                    style: AppStyle.poppinsTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Constants.lightgray900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 1,
                                    color: Constants.horizontalLineColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '1.5 km',
                                    style: AppStyle.poppinsTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Constants.lightgray900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          _programsListView(programListInPerson),
                        ],
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: activeTag == 1,
                    child: SizedBox(
                      height: 24,
                    ),
                  ),
                  Offstage(
                    offstage: activeTag == 1,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CommonImageView(
                                svgPath: "assets/images/icon_vidcamera.svg",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Online',
                                style: AppStyle.poppinsTextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.lightgray900,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          _programsListView(programListOnline),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _programsListView(List listItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Constants.lightBlue90019,
                  spreadRadius: getHorizontalSize(2.00),
                  blurRadius: getHorizontalSize(2.00),
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listItems[index].programTitle,
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.bluegray900,
                        ),
                      ),
                      CommonImageView(
                        svgPath: "assets/images/icon_prog_loc.svg",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    listItems[index].programTags,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Constants.lightgray900,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listItems[index].programDescription,
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Constants.lightgray900,
                            ),
                          ),
                          Text(
                            listItems[index].programDays,
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Constants.inactiveIconColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        listItems[index].programPrice,
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Constants.bluegray900,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
