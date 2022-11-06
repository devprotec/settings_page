import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';
import 'onboarding_controller.dart';

class ProfileController extends GetxController {
  var selectedRole = ''.obs;
  var username = ''.obs;
  var dayOfBirth = ''.obs;
  var monthOfBirth = ''.obs;
  var yearOfMonth = ''.obs;
  var gender = Genders.NONE.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
}
