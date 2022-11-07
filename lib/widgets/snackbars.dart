import 'package:mhc_customer/util/exports.dart';

class CustomSnackBars {
  void infoSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      overlayBlur: 5,
      borderWidth: 2,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.error, color: Colors.white, size: 20),
    );
  }

  void loadingSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,

      messageText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Constants.spaceSmall,
            const LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            Constants.spaceSmall,
          ]),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      overlayBlur: 5,
      borderWidth: 2,
      isDismissible: false,
      colorText: Colors.white,
      duration: const Duration(hours: 1),
      // const Icon(
      //   Icons.error,
      //   color: Colors.white,
      //   size: 20,
      // ),
    );
  }

  void errorSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      overlayBlur: 5,
      borderWidth: 2,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.error, color: Colors.white, size: 20),
    );
  }

  void successSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      overlayBlur: 5,
      borderWidth: 2,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.error, color: Colors.white, size: 20),
    );
  }
}
