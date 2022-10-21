import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:settings_page/screens/explore_and_book/models.dart/artilce_model.dart';
import 'package:settings_page/screens/explore_and_book/widgets/articles_card.dart';
import 'package:settings_page/screens/explore_and_book/widgets/event_card.dart';
import 'package:settings_page/screens/explore_and_book/widgets/explore_container.dart';
import 'package:settings_page/util/exports.dart';

import '../widgets/pagination.dart';
import '../widgets/recents.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Bookings> {
  int programCurrent = 0;
  int newArticlesCurrent = 0;
  int popularArticlesCurrent = 0;
  final colors = [
    Constants.pColor,
    Constants.fromHex('#9F5ED2'),
    Constants.fromHex('#FBAF2A'),
    Constants.fromHex('#6C9301'),
    Constants.fromHex('#2CAA6A'),
    Constants.fromHex('#E46E2C'),
    Constants.fromHex('#D74090'),
    Constants.fromHex('#6878D8'),
  ];

  List<ExploreContainer> exploreContainer1 = [];
  List<ExploreContainer> exploreContainer2 = [];

  @override
  void initState() {
    colors.shuffle();
    final coaches = ExploreContainer(
      text: "Coaches",
      containerColor: colors[0],
      iconData: Icons.people_alt,
      onTap: () {},
    );
    final wellness_professional = ExploreContainer(
      text: "Wellness Professionals",
      containerColor: colors[1],
      iconData: MdiIcons.heartCircle,
      onTap: () {},
    );
    final events = ExploreContainer(
      text: "Events",
      containerColor: colors[2],
      iconData: Icons.event,
      onTap: () {},
    );
    final blog = ExploreContainer(
      text: 'Blog',
      containerColor: colors[3],
      iconData: Icons.article,
      onTap: () {},
      isLast: 16,
    );
    final sport_places = ExploreContainer(
      text: "Sport Places",
      containerColor: colors[4],
      iconData: Icons.location_on,
      onTap: () {},
    );

    final activities = ExploreContainer(
      text: "Activities",
      containerColor: colors[5],
      iconData: Icons.sports_basketball,
      onTap: () {},
    );
    final online_class = ExploreContainer(
      text: "Online Classes",
      containerColor: colors[6],
      iconData: Icons.videocam,
      onTap: () {},
    );
    final faq = ExploreContainer(
      text: 'FAQ',
      containerColor: colors[7],
      iconData: Icons.help,
      onTap: () {},
      isLast: 16,
    );
     exploreContainer1 = [coaches, wellness_professional, events, blog];

     exploreContainer2 = [sport_places, activities, online_class, faq];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          color: Colors.black54,
          iconSize: 30,
          onPressed: () {
            Get.to(()=>Recent());
          },
          icon: Icon(Icons.search),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "msg_add_your_locati".tr,
              style: AppStyle.interTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Constants.fromHex('#0E1339')),
            ),
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Colors.black54,
            onPressed: () {},
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 25),
              child: Text(
                'explore'.tr,
                style: AppStyle.poppinsTextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Constants.fromHex('#161B46'),
                ),
              ),
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: exploreContainer1.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return exploreContainer1[index];
                  }),
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: exploreContainer2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return exploreContainer2[index];
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: articleRow(
                'popular_programs'.tr,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 215,
                padEnds: false,
                disableCenter: true,
                viewportFraction: 0.8,
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
            Constants.spaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Pagination(
                current: programCurrent,
                itemsLength: programs.length,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: articleRow(
                'new_on_mhc'.tr,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 215,
                padEnds: false,
                disableCenter: true,
                viewportFraction: 0.8,
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
                    newArticlesCurrent = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: [
                ArticlesCard(
                  article: artilce1,
                ),
                ArticlesCard(
                  article: artilce2,
                ),
                ArticlesCard(
                  article: artilce3,
                )
              ],
            ),
            Constants.spaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Pagination(
                current: newArticlesCurrent,
                itemsLength: programs.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: articleRow(
                'popular_articles'.tr,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 215,
                padEnds: false,
                disableCenter: true,
                viewportFraction: 0.8,
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
            Constants.spaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Pagination(
                current: popularArticlesCurrent,
                itemsLength: programs.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  articleRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.tr,
          style: AppStyle.poppinsTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Constants.fromHex('#161B46'),
          ),
        ),
        Text(
          'lbl_more'.tr,
          style: AppStyle.poppinsTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Constants.fromHex('#00ACE9'),
          ),
        ),
      ],
    );
  }
}
