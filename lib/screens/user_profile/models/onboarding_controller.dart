import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum UserTypes { CUSTOMER, PROFESSIONAL, NONE }

enum Genders { MALE, FEMALE, NONE }

class OnBoardingController extends GetxController {
  var sex = Rx<Genders>(Genders.NONE).obs;
  var usertype = Rx<UserTypes>(UserTypes.NONE).obs;
  var sexError = false.obs;
  var bloodError = false.obs;
  var userTypeError = false.obs;
  var allergiesError = false.obs;
  var diseaseError = false.obs;
  var goalsError = false.obs;
  var contactError = false.obs;
  var bloodtype = ''.obs;
  var transition = 0.obs;
  var pageController = PageController(initialPage: 0).obs;
  var knowsBloodType = false.obs;
  var allergies = Rx<Options>(Options.none);
  var disease = Rx<Options>(Options.none);
  var weight = Rx<Options>(Options.kg);
  var height = Rx<Options>(Options.cm);
  final allergy = ValueNotifier<String>('').obs;
  final diseaseName = ValueNotifier<String>('').obs;
  final fname = ValueNotifier<String>('').obs;
  final lname = ValueNotifier<String>('').obs;
  final phone = ValueNotifier<String>('').obs;
  final dob = ValueNotifier<String>('').obs;
  var goals = [].obs;

  void next() {
    print('pageController.page.value: ${pageController.value.page}');

    if (pageController.value.page!.toInt() < 7) {
      pageController.value.animateToPage(
        pageController.value.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      transition.value = pageController.value.page!.toInt() + 1;
    }
  }

  void addGoal(String goal) {
    {
      if (goals.contains(goal)) {
        goals.remove(goal);
      } else {
        goals.add(goal);
      }
      update();

      print("clicked on $goal");
      print("All list on ${goals.value}");
    }
  }

  void prev() {
    print('pageController.page.value: ${pageController.value.page}');

    if (pageController.value.page!.toInt() > 0) {
      pageController.value.animateToPage(
        pageController.value.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      transition.value = pageController.value.page!.toInt() - 1;
    } else {
      Get.back();
    }
  }

  void validation() {
    if (pageController.value.page!.toInt() == 0) {
      contactValidation();
    } else if (pageController.value.page!.toInt() == 1) {
      page2Validation();
    } else if (pageController.value.page!.toInt() == 2) {
      page3Validation();
    } else if (pageController.value.page!.toInt() == 3) {
      page4Validation();
    } else if (pageController.value.page!.toInt() == 4) {
      contactValidation();
    } else if (pageController.value.page!.toInt() == 5) {
      page6Validation();
    } else if (pageController.value.page!.toInt() == 6) {
      contactValidation();
    } else if (pageController.value.page!.toInt() == 7) {
      contactValidation();
    } else {}
  }

  void contactValidation() {
    if (fname.value.value.isEmpty ||
        fname.value.value.isEmpty ||
        fname.value.value.isEmpty) {
      contactError.value = true;
    } else {
      next();
    }
  }

  void page2Validation() {
    if (sex.value.value == Genders.NONE || dob.value.value.isEmpty) {
      sexError.value = true;
    } else {
      next();
    }
  }

  void page3Validation() {
    if (usertype.value.value == UserTypes.NONE) {
      userTypeError.value = true;
    } else {
      if (usertype.value.value == UserTypes.PROFESSIONAL) {
        //Get.to(() => const UserRoles());
      } else {
        next();
      }
    }
  }

  void page4Validation() {
    if (bloodtype.value.isEmpty) {
      bloodError.value = true;
    } else if (allergies.value == Options.none ||
        (allergies.value == Options.yes && allergy.value.value.isEmpty)) {
      allergiesError.value = true;
    } else if (disease.value == Options.none ||
        (disease.value == Options.yes && diseaseName.value.value.isEmpty)) {
      print("bloodtype.value.isEmpty");

      diseaseError.value = true;
    } else {
      next();
    }
  }

  void page6Validation() {
    if (goals.isEmpty) {
      goalsError.value = true;
    } else {
      next();
    }
  }
}


enum Options {
  none,
  yes,
  no,
  dontKnow,
  kg,
  ib,
  cm,
  ft,
}

enum OptionsType {
  allergies,
  weight,
  height,
  disease,
}
