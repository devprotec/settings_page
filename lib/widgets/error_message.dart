import 'package:settings_page/util/exports.dart';



//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:mhc_consumer/utils/constants.dart';

import '../controllers/global_controller.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalController controller = Get.put(GlobalController());
    return Obx(() {
      bool hasError = controller.hasError.value || message!.isNotEmpty;
      return !hasError
          ? Constants.space
          : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffFFF2F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(
                  Icons.info,
                  color: Color(0xffE74C3C),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    message!.isNotEmpty
                        ? message ?? controller.errorMessage.value
                        : controller.errorMessage.value,
                    style: const TextStyle(
                      color: Color(0xffE74C3C),
                    ),
                  ),
                ),
              ]),
            );
    });
  }
}



class ErrorMessageV1 extends StatelessWidget {
  final String message;
  final Color? messageBackgroundColor;
  final IconData? infoIcon;
  final Color? messageColor;
  const ErrorMessageV1(
      {Key? key,
      required this.message,
      this.infoIcon,
       this.messageBackgroundColor,
      
       this.messageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: messageBackgroundColor ?? Color(0xffFFF2F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          
          infoIcon ?? Icons.info,
          color: messageColor ?? Color(0xffE74C3C),
          size:18,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            message,
            style: TextStyle(
              color: messageColor ?? Color(0xffE74C3C),
            ),
          ),
        ),
      ]),
    );
  }
}


