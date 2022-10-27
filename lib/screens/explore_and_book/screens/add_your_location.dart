import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:settings_page/screens/explore_and_book/models.dart/coach_filter_controller.dart';
//import 'package:google_place/google_place.dart';
import 'package:settings_page/util/exports.dart';
import 'package:google_place/google_place.dart' hide Location;

import '../../../widgets/snackbars.dart';

class AddYourLocation extends StatefulWidget {
  @override
  _AddYourLocationState createState() => _AddYourLocationState();
}

class _AddYourLocationState extends State<AddYourLocation> {
  TextEditingController controller = TextEditingController();
  var coachFilterController = Get.put(CoachFilterController());
  //final Geolocator _geolocatorPlatform = Geolocator.;
  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];
  final locationHistor = <String>[];
  bool enabled = true;
  String addressName = 'National Museum of Ghana';
  String addressStreet = 'GZ-183-7623';
  String subLocality = 'Greater Accra';
  String locality = 'Accra';
  String country = 'Ghana';
  FocusNode focusNode = FocusNode();
  late StreamSubscription<Position> locationSubscription;
  bool isLoading = false;
  bool locationSelected = false;

  @override
  void initState() {
    googlePlace = GooglePlace('AIzaSyDzYdJqertRHdlzpDm1UHt2l3vMa5_Ow7M');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppbarWidget(
              appBarTitle: "msg_add_your_locati".tr,
              hasActions: true,
              leadingWidget: GestureDetector(
                child: closeButton(),
                onTap: () {
                  Get.back();
                },
              ),
            )),
        floatingActionButton: locationSelected
            ? Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Button(
                  text: "lbl_save".tr,
                  onPressed: () {
                    Get.back();
                  },
                  width: double.infinity,
                ),
              )
            : null,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(color: Constants.pColor),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: controller,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            predictions = [];
                          });
                        } else {
                          autoCompleteSearch(value);
                        }
                      },
                      focusNode: focusNode,
                      cursorColor: Constants.fromHex('#6E768D'),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Constants.fromHex('#F4F5FB'),
                        suffixStyle: TextStyle(fontSize: 12),
                        isDense: true,
                        focusColor: Constants.mainColor,
                        hintText: "msg_search_for_locati".tr,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Constants.mainColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Constants.fromHex('#6E768D'),
                          iconSize: 30,
                        ),
                        suffixIcon: focusNode.hasFocus
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.text = '';

                                    predictions = [];
                                  });
                                },
                                child: Align(
                                  widthFactor: 1,
                                  heightFactor: 1,
                                  child: CommonImageView(
                                    svgPath: 'assets/svgs/search_close.svg',
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ),
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  await _handlePermission();
                                } catch (e) {
                                  Get.closeCurrentSnackbar();
                                  CustomSnackBars().errorSnackBar(
                                      title: "Error",
                                      message:
                                          "Network error occured. Please check your connectivity and try again");
                                }
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        Constants.fromHex('#CDF1FF'),
                                    child: Image.asset(
                                      "assets/images/location_icon.png",
                                      color: Constants.lightBlue500,
                                    ),
                                  ),
                                  Constants.spaceMediumRow,
                                  Text(
                                    "msg_share_your_locati".tr,
                                    style: AppStyle.poppinsTextstyle(
                                      17,
                                      FontWeight.w500,
                                      Constants.gray900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Constants.fromHex('#E6E8F3'),
                                radius: 18,
                                child: Icon(
                                  Icons.update,
                                  size: 18,
                                  color: Constants.fromHex('#6E768D'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      addressName,
                                      style: AppStyle.poppinsTextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Constants.fromHex('#0E1339'),
                                      ),
                                    ),
                                    Text(
                                      "$addressStreet, ${subLocality == '' ? '' : subLocality + ', '}${locality == '' ? '' : locality + ', '} ${country == '' ? '' : country}",
                                      style: AppStyle.poppinsTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Constants.fromHex('#34405E'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Constants.spaceMediumRow,
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Constants.pColor,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                )),
                              )
                            ],
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return locationWidget(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace!.autocomplete.get(value, region: 'gh');
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  locationWidget({required int index}) {
    return GestureDetector(
      onTap: () async {
        CustomSnackBars().loadingSnackBar(
            title: 'Please Wait', message: 'We are getting your location');

        setState(() {
          getAddressFromSearch(
            predictions[index].description!,
            predictions[index].structuredFormatting!.mainText!,
          );
          focusNode.unfocus();
          controller.text = '';
          predictions = [];
          locationSelected = true;
        });
        await Future.delayed(
          Duration(milliseconds: 3500),
        );
        Get.closeCurrentSnackbar();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Constants.fromHex('#E6E8F3'),
              radius: 18,
              child: Icon(
                locationHistor.contains(predictions[index].description!)
                    ? Icons.update
                    : Icons.location_on,
                size: 18,
                color: Constants.fromHex('#6E768D'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    predictions[index].structuredFormatting!.mainText ?? '',
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Constants.fromHex('#0E1339'),
                    ),
                  ),
                  Text(
                    predictions[index].structuredFormatting!.secondaryText ??
                        '',
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.fromHex('#34405E'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    CustomSnackBars().loadingSnackBar(
        title: 'Please Wait', message: 'We are getting your location');
    final position = await Geolocator.getCurrentPosition();
    await getAddressFromDevice(position);
    return;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.dialog(
          AlertDialog(
            title: Text('Alert'),
            content: Text(
                'Please note: you need to allow location permission to use this feature'),
            actions: [
              TextButton(
                child: Text('ok'),
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                  Get.back();
                },
              ),
            ],
          ),
        );
        return false;
      }
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (permission != LocationPermission.denied && !serviceEnabled) {
      try {
        await _getCurrentPosition();
      } catch (e) {
        Get.closeCurrentSnackbar();
      }
      return false;
    }

    if (permission == LocationPermission.deniedForever) {
      Get.dialog(
        AlertDialog(
          title: Text('Alert'),
          content: Text(
              'Please note: you need to allow location permission to use this feature'),
          actions: [
            TextButton(
              child: Text('ok'),
              onPressed: () async {
                await Geolocator.openAppSettings();
                Get.back();
              },
            ),
          ],
        ),
      );
      return false;
    }

    await _getCurrentPosition();
    return true;
  }

  Future<String> getAddressFromDevice(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      addressName = place.name!;
      locality = place.locality!;
      subLocality = place.subLocality!;
      country = place.country!;
      addressStreet = place.street!;
      locationSelected = true;
      coachFilterController.userLocation.value = place.name!;
    });
    await Future.delayed(
      Duration(milliseconds: 3500),
    );
    Get.closeCurrentSnackbar();

    return place.toString();
  }

  Future<String> getAddressFromSearch(
      String addressFromSearch, String addressNameFromSearch) async {
    List<Location> locations = await locationFromAddress(addressFromSearch);
    Location location = locations[0];
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    Placemark place = placemarks[0];

    setState(() {
      addressName = addressNameFromSearch;
      locality = place.locality!;
      subLocality = place.subLocality!;
      country = place.country!;
      addressStreet = place.street!;
      locationSelected = true;
      coachFilterController.userLocation.value = addressName;
    });

    return place.toString();
  }
}
