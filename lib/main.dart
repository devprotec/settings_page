import 'package:flutter/services.dart';
import 'package:settings_page/screens/Home/landing_page.dart';
import 'package:settings_page/screens/events/all_events.dart';
import 'package:settings_page/screens/events/empty_create_event_page.dart';
import 'package:settings_page/screens/explore_and_book/screens/bookings.dart';
import 'package:settings_page/screens/explore_and_book/screens/search_professional.dart';
import 'package:settings_page/screens/explore_and_book/screens/select_coach_filter.dart';
import 'package:settings_page/screens/explorer_booker/preview_program_screen.dart';
import 'package:settings_page/screens/schedule/empty_schedule_screen.dart';
import 'package:settings_page/screens/settings_page/profile.dart';
import 'package:settings_page/util/exports.dart';

import 'screens/splash.dart';
import 'screens/user_profile/coach_details_screen.dart';
import 'screens/user_profile/edit_billing_address.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarBrightness: Brightness.dark, //status bar brigtness
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white, //navigation bar icon
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'settings_page',
      //home: LandingPage(),
      home: const SplashScreen(),
    );
  }
}
