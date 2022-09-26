import 'package:settings_page/util/exports.dart';


class SettingsController extends GetxController{
  var selectedLanguage = "lbl_english".tr.obs;
  var changePasswordError = false.obs;
  var passwordChangedIsSuccessful = false.obs;
  var changePasswordErrorMessage = ''.obs;


   onPasswordChange(
      String currentPassword, String newPassword, String confirmPassword) {
    if (newPassword == confirmPassword) {
      //To-Do
      // implement change password
      passwordChangedIsSuccessful.value = true;
      changePasswordError.value = false;
      Get.to(PrivacyAndSecurityScreen());
    } else {
      changePasswordError.value = true;
      changePasswordErrorMessage.value = "passwords_do".tr;

    }
  }

}