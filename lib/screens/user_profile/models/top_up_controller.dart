import 'package:settings_page/util/exports.dart';

class TopUpController extends GetxController {
  var vendoName = ''.obs;
  var lastDigits = ''.obs;
  var controllerValue = "0".obs;
  var selectedVendo = ''.obs;
  var selectedPaymentVendo = PaymentMethod().obs;
}
