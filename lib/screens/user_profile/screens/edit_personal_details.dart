import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../models/user.dart';
import '../../../theme/app_style.dart';
import '../../../util/constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/form_widget.dart';
import '../models/profile_controller.dart';
import '../widgets/country_code.dart';

class EditPersonalDetails extends GetView<ProfileController> {
  final User user;
  EditPersonalDetails({Key? key, required this.user}) : super(key: key);

  @override
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    
    controller.username.value = user.username!;
    controller.dayOfBirth.value = user.dataOfBirth!.day.toString();
    controller.monthOfBirth.value = user.dataOfBirth!.month.toString();
    controller.yearOfMonth.value = user.dataOfBirth!.year.toString();
    controller.gender.value = user.gender!;
    controller.email.value = user.email!;
    controller.phoneNumber.value = user.phonenumber!;

    var name = ValueNotifier(controller.username.value);
    var email = ValueNotifier(controller.email.value);
    var phoneNumber = ValueNotifier(controller.phoneNumber.value.substring(5));
    
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text('personal_details'.tr,
                style: AppStyle.poppinsTextStyle(
                  color: Constants.fromHex('#0E1339'),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
               ),
              actions: [
                IconButton(
                  color: Constants.fromHex('#6E768D'),
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: uploadAvatar("assets/images/active.png"),
                    ),
                    InputForms(
                      obscure: false,
                      textStyle: AppStyle.poppinsTextStyle(
                        color: Constants.fromHex('#0E1339'),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                      description: 'name'.tr,
                      descriptionTextStyle: AppStyle.poppinsTextStyle(
                        color: Constants.fromHex('#34405E'),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                      notifier: name,
                      onChange: (val) {
                        name.value = val!;
                      }
                    ),
                    text('dob'),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Constants.fromHex('#F4F5FB')),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 13),
                          child: Obx(
                            () => Text(
                              controller.dayOfBirth.value +
                              '/' +
                              controller.monthOfBirth.value +
                              '/' +
                              controller.yearOfMonth.value,
                              style: AppStyle.poppinsTextstyle (
                                
                               16,
                                 FontWeight.w500,Constants.fromHex('#0E1339'),
                              ),
                            ),
                          ) 
                        ),
                      ),
                      Constants.spaceMedium,
                      text('lbl_sex'.tr),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          genderContainer('female'), 
                          genderContainer('male')
                        ],
                      ),
                      Constants.spaceMedium,
                      text('phone'),
                      Constants.spaceSmall,
                      CountryCode(
                        phoneNumber: phoneNumber,
                      ),
                      InputForms(
                        obscure: false,
                        textStyle: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#0E1339'),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        description: 'email'.tr,
                        descriptionTextStyle: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#34405E'),
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        notifier: email,
                        onChange: (val) {
                          email.value = val!;
                        }
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Button(
                    text: 'save'.tr,
                    onPressed: (){}
                  ),
                )
              ]
            )
          )
        );
      }

  genderContainer(String name) {
    return Container(
      height: 50,
      width: Get.size.width * 0.42,
      child: Center(
        child: Text(
          name.tr,
          style: AppStyle.poppinsTextStyle(
            color: Constants.fromHex('#454E90'),
            fontWeight: FontWeight.w500,
            fontSize: 14
          ),
        )
      ),
      decoration: BoxDecoration(
        color: controller.gender.value.name.capitalize == name.tr
        ? Constants.fromHex('#D4D9F5')
        : Constants.fromHex('#F4F5FB'),
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  text(String text) {
    return Text(
      text.tr,
      style: AppStyle.poppinsTextStyle(
        color: Constants.fromHex('#34405E'),
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
    );
  }
}

Widget uploadAvatar(String imagePath) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      CommonImageView(
        imagePath: imagePath,
        height: 90,
        width: 90,
        fit: BoxFit.cover,
      ),
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: Constants.fromHex('#0095E9'), 
            shape: BoxShape.circle
          ),
          child: Center(
            child: Stack(
              children: [
                CommonImageView(
                  svgPath: 'assets/svgs/img_camera.svg', 
                  height: 15,
                  width: 15
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
text(String text) {
  return Text(
    text.tr,
    style: AppStyle.poppinsTextStyle(
      color: Constants.fromHex('#34405E'),
      fontSize: 14,
      fontWeight: FontWeight.w500
    ),
  );
}