// ignore_for_file: prefer_const_constructors


import 'package:settings_page/util/exports.dart';


import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../settings_page/profile.dart';
import 'customer_homepage.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PersistentTabController _controller = PersistentTabController();
  int _index = 0;
  Size size = Size(0, 0);

  List<Widget> _buildScreens() {
    return [
      ComingSoonPage(text: "Coming Soon: Customer Homepage",),
      ComingSoonPage(text: 'Coming Soon: Customer Explore and Book',),
      ComingSoonPage(text: 'Coming Soon: Customer Bookings',),
      ComingSoonPage(text: 'Coming Soon: Customer Journal',),
      UserProfile(user: customerUser),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    print(_controller.index);
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/home.svg",
          color: _index == 0 ? Constants.pColor : Constants.textColor2,
        ),
        title: "Home",
        activeColorPrimary: Constants.pColor,
        inactiveColorPrimary: Constants.textColor2,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/explore.svg",
          color: _index == 1 ? Constants.pColor : Constants.textColor2,
        ),
        title: "Explore",
        activeColorPrimary: Constants.pColor,
        inactiveColorPrimary: Constants.textColor2,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/bookings.svg",
          color: _index == 2 ? Constants.pColor : Constants.textColor2,
        ),
        title: "Bookings",
        activeColorPrimary: Constants.pColor,
        inactiveColorPrimary: Constants.textColor2,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/studio.svg",
          color: _index == 3 ? Constants.pColor : Constants.textColor2,
        ),
        title: "Journal",
        activeColorPrimary: Constants.pColor,
        inactiveColorPrimary: Constants.textColor2,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/profile.svg",
          color: _index == 4 ? Constants.pColor : Constants.textColor2,
        ),
        title: "Profile",
        activeColorPrimary: Constants.pColor,
        inactiveColorPrimary: Constants.textColor2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _index = _controller.index;
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: false,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        onItemSelected: (value) {
          setState(() {
            _index = _controller.index;
          });
        },
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0XFFE6E8F3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
            // BoxShadow(
            //   color: Color(0XFFE6E8F3),
            //   spreadRadius: 0.01,
            //   blurRadius: 1,
            //   offset: Offset(-0, -0), // changes position of shadow
            // ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
