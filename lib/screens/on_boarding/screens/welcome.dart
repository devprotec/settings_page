import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/widgets/button.dart';

//import '../../../../utils/constants.dart';
import '../../../../widgets/title_text.dart';
import '../../../util/constants.dart';
import '../../../widgets/button.dart';
import 'on_boarding.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget countryPicker = const SizedBox();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            CountryCodePicker(
                onChanged: (val) {
                  print(val);
                },
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'GH',
                favorite: const ['+233', 'GH'],
                countryFilter: const [],
                showFlagDialog: true,
                showDropDownButton: true,
                padding: EdgeInsets.zero,
                flagWidth: 25,
                hideMainText: true,
                dialogSize: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.95,
                ),
                // comparator: (a, b) => b.name.compareTo(a.name),
                //Get the country information relevant to the initial selection
                onInit: (code) {
                  print(code);
                }),
          ],
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          title: const Text(''),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText('welcome'.tr, fontSize: 30),
                Constants.spaceLarge,
                Text("welcomeMessage".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff6E768D),
                      fontSize: 14,
                    )),
                Image.asset(
                  'assets/images/welcome.png',
                  height: size.height * 0.5,
                ),
                Button(
                    text: 'start'.tr,
                    onPressed: () {
                      Get.to(() => const OnBoarding());
                      // Get.to(() => const Contact());
                    })
              ]),
        ),
      ),
    );
  }
}
