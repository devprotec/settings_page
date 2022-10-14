import 'package:get/get.dart';

import 'payment_method_model.dart';

class TopUpController extends GetxController{
  var vendoName = ''.obs;
  var lastDigits = ''.obs;
  var controllerValue = "0".obs;
  var selectedVendo = ''.obs;
  var selectedPaymentVendo = PaymentMethod().obs;
  
}