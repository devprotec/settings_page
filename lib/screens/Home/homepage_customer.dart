import 'package:mhc_customer/util/exports.dart';

class CustomerHomePage extends StatefulWidget {
  final UserProfileModel user;
  const CustomerHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int programCurrent = 0;
  int popularArticlesCurrent = 0;
  bool closeStack = false;
  ScrollController controller = ScrollController();

  String getWellnessGoalsInCorrectFormat(List list) {
    String wellnessGoalsLocalList = '';
    widget.user.profile!.wellnessGoals!.forEach(
      (element) {
        var wellnessGoalList = element.split("_");
        print(wellnessGoalList);
        var finalWellnessGoal = '';
        wellnessGoalList.forEach(
          (element) {
            finalWellnessGoal = "$finalWellnessGoal $element";
            finalWellnessGoal = finalWellnessGoal;
          },
        );

        wellnessGoalsLocalList =
            element == widget.user.profile!.wellnessGoals!.last
                ? wellnessGoalsLocalList + finalWellnessGoal.capitalize!
                : wellnessGoalsLocalList + finalWellnessGoal.capitalize! + ", ";
      },
    );
    return wellnessGoalsLocalList;
  }

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeStack = controller.offset > 50;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double stackHeight = size.height * 0.50;
    final double programCardHeight = 215;
    final localWellnessGoals =
        getWellnessGoalsInCorrectFormat(widget.user.profile!.wellnessGoals!);
    print(localWellnessGoals);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(stackHeight),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1500),
            opacity: closeStack ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              width: closeStack ? 0 : size.width,
              //alignment: Alignment.topCenter,
              height: closeStack ? 0 : stackHeight,
              child: Stack(
                children: [
                  SvgPicture.asset("assets/svgs/home_big_circle_left.svg"),
                  Positioned(
                    right: -20,
                    top: 70,
                    child: SvgPicture.asset(
                        "assets/svgs/home_small_circle_right.svg"),
                  ),
                  widget.user.profile!.gender == "M"
                      ? Positioned(
                          top: 55,
                          right: 70,
                          child:
                              SvgPicture.asset("assets/svgs/home_athlete.svg"),
                        )
                      : Positioned(
                          top: 80,
                          right: 20,
                          child: SvgPicture.asset(
                              "assets/svgs/home_athlete_female.svg"),
                          height: 150,
                        ),
                  Positioned(
                    bottom: size.height * 0.43,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(child: Icon(MdiIcons.chatOutline)),
                              Constants.spaceMediumRow,
                              InkWell(
                                child: Icon(Icons.shopping_cart_outlined),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        "Hi, ${widget.user.firstName!}!",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'This is your next bookings'.tr,
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.fromHex(
                            '#CDF1FF',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        'SEE All'.tr,
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Constants.fromHex(
                            '#0095E9',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      width: closeStack ? 0 : size.width,
                      height: programCardHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: programs.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ProgramCard(
                              eventDataModel: programs[index],
                              width: size.width * 0.9,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Constants.spaceMediumColumn,
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.only(left: 12, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: widget.user.profile!.gender == "F"
                      ? Constants.fromHex('#F3DAF5')
                      : Constants.fromHex('#FFDEC2'),
                ),
                child: Stack(children: [
                  Positioned(
                    right: 0,
                    top: 35,
                    child: SvgPicture.asset(
                      widget.user.profile!.gender == "F"
                          ? "assets/svgs/home_athlete_female.svg"
                          : "assets/svgs/home_athlete.svg",
                      height: 70,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constants.spaceMediumColumn,
                      Text(
                        "Your Wellness Goals".tr,
                        style: Constants.titleTextStyle,
                      ),
                      Constants.spaceSmallColumn,
                      Container(
                        width: size.width * 0.55,
                        child: Text(
                          localWellnessGoals,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Constants.fromHex('#34405E'),
                          ),
                        ),
                      ),
                      Constants.spaceSmallColumn,
                      Text(
                        "CHANGE GOALS",
                        style: Constants.normalTextStyle,
                      ),
                      Constants.spaceSmallColumn
                    ],
                  ),
                ]),
              ),
              Constants.spaceMediumColumn,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ArticleRow(
                  text: 'Programs For You'.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 215,
                    padEnds: false,
                    disableCenter: true,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    //enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        programCurrent = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    EventCardCustomer(
                      eventDataModel: programs[0],
                    ),
                    EventCardCustomer(
                      eventDataModel: programs[1],
                    ),
                    EventCardCustomer(
                      eventDataModel: programs[2],
                    )
                  ],
                ),
              ),
              Constants.spaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Pagination(
                  current: programCurrent,
                  itemsLength: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ArticleRow(
                  text: 'Recommended to Read'.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 215,
                    padEnds: false,
                    disableCenter: true,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    //enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,

                    onPageChanged: (index, reason) {
                      setState(() {
                        popularArticlesCurrent = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    ArticlesCard(
                      article: artilce4,
                    ),
                    ArticlesCard(
                      article: artilce5,
                    ),
                    ArticlesCard(
                      article: artilce6,
                    )
                  ],
                ),
              ),
              Constants.spaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Pagination(
                  current: popularArticlesCurrent,
                  itemsLength: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
