
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_image_view.dart';
import '../../affiliate_program/widget/bottomsheets.dart';
import '../models/payment_method_model.dart';
import '../models/top_up_controller.dart';

class PaymentMethodBottomSheet extends GetView<TopUpController>{
  @override 
  Widget build(BuildContext context){
    Get.put(TopUpController());
    return GeneralContainer(
      containerSize: Get.size.height*0.45,
      titleText: 'choose_payment'.tr, 
      widgetList: [
        paymentMethodListTitle(mastercard),
        paymentMethodListTitle(visa),
        paymentMethodListTitle(mtn),
        paymentMethodListTitle(tigo)
        ]);

  }

  paymentMethodListTitle (PaymentMethod paymentMethod) {
    String imagePath = getVendorImage(paymentMethod.vendoName!);
    
 
    return ListTile(
        //horizontalTitleGap: 5,
        title: Text(
          paymentMethod.vendoName! +" - "+ paymentMethod.lastDigits!,
          style: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: 'Poppins',
  )
        ),
        leading: CommonImageView(imagePath: imagePath, height: 30, width: 40,),
        onTap: () {
          controller.selectedPaymentVendo.value = paymentMethod;
          Get.back();
        },
        trailing: paymentMethod == controller.selectedPaymentVendo.value 
                
            ? CommonImageView(
                imagePath: 'assets/images/img_vector_20X20.png',
                height: 22,
                width: 22)
            : const SizedBox.shrink());
  }
}
