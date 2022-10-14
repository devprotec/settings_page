import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_style.dart';
import '../../../util/constants.dart';
import '../../../widgets/button.dart';
import '../models/onboarding_controller.dart';
import '../widgets/blood_type.dart';
import 'edit_height_weight.dart';


class EditBloodType extends GetView<OnBoardingController> {
  const EditBloodType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              color: Constants.fromHex('#6E768D'),
              onPressed: () {
                Get.back();
              },
              icon:const  Icon(
                Icons.close,
                size: 22,
              ),
            )
          ],
          
          centerTitle: true,
          title: Text(
            'health_details'.tr,
            style: AppStyle.poppinsTextStyle(
              color: Constants.fromHex('#0E1339'),
              fontWeight: FontWeight.w600,
              fontSize: 17),
            ),

          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5,
                    width: Get.size.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Constants.pColor ,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: Get.size.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:const Color(0xffE6E8F3),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children:  [
               Expanded(
                child: BloobType()
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Button(
                  text:'next'.tr,
                  onPressed: () {   
                    Get.to(()=>const EditHeightWeight());       
                  }
                ),
              ),
              Constants.spaceLarge,
              Constants.spaceSmall
            ],
          ),
        ));
  }
}

