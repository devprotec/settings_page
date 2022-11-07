import 'package:mhc_customer/util/exports.dart';

enum UserTypes { CUSTOMER, PROFESSIONAL, NONE }

enum Genders { M, F, NONE }

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
  var countryCode = '+233'.obs;
  var transition = 0.obs;
  var pageController = PageController(initialPage: 0).obs;
  var knowsBloodType = false.obs;
  var allergies = Rx<Options>(Options.none);
  var disease = Rx<Options>(Options.none);
  var weight = Rx<Options>(Options.kg);
  var weightVal = 0.0.obs;
  var height = Rx<Options>(Options.cm);
  var heightVal = 0.0.obs;
  final allergy = ValueNotifier<String>('').obs;
  final diseaseName = ValueNotifier<String>('').obs;
  final fname = ValueNotifier<String>('').obs;
  final lname = ValueNotifier<String>('').obs;
  final phone = ValueNotifier<String>('').obs;
  final dob = ValueNotifier<String>('').obs;
  var goals = [].obs;
  final GlobalController _globalController = Get.put(GlobalController());

  final ProfileMutation _profilemutations = ProfileMutation();

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
      // }
      //else if (pageController.value.page!.toInt() == 2) {
      //  page3Validation();
    } else if (pageController.value.page!.toInt() == 2) {
      page4Validation();
    } else if (pageController.value.page!.toInt() == 3) {
      next();
    } else if (pageController.value.page!.toInt() == 4) {
      page6Validation();
    } else if (pageController.value.page!.toInt() == 5) {
      Get.to(() => const LandingPage());
      //}
      // else if (pageController.value.page!.toInt() == 6) {
      // Get.to(() => const LandingPage());
    } else {}
  }

  void contactValidation() async {
    if (fname.value.value.isEmpty ||
        lname.value.value.isEmpty ||
        fname.value.value.isEmpty) {
      contactError.value = true;
    } else {
      AuthController().updateUser(
          data: {
            "firstName": fname.value.value,
            "lastName": lname.value.value,
          },
          showLoader: false,
          fun: () {
            next();
          });
    }
  }

  void page2Validation() {
    if (sex.value.value == Genders.NONE || dob.value.value.isEmpty) {
      sexError.value = true;
    } else {
      next();
    }
  }

  // void page3Validation() {
  //   if (usertype.value.value == UserTypes.NONE) {
  //     userTypeError.value = true;
  //   } else {
  //     if (usertype.value.value == UserTypes.PROFESSIONAL) {
  //      // Get.to(() => const UserRoles());
  //     } else {
  //       next();
  //     }
  //   }
  // }

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
      addProfile(fun: () {
        next();
      });
    }
  }

  addProfile({
    required Function() fun,
  }) async {
    var profile = {
      "profile": {
        "user": userData['id'],
        "dateOfBirth": dob.value.value,
        "gender": sex.value.value.name,
        "profilePicture": "https://",
        "phoneNumber": "0${phone.value.value.trim()}",
        "weight": weightVal.value,
        "height": heightVal.value,
        "bloodGroup": bloodtype.value,
        "allergies": [allergies.value.name, allergy.value.value],
        "chronicDiseases": [disease.value.name, diseaseName.value.value],
        "wellnessGoals": goals,
        "addresses": {
          "name": "test",
          "street": "street",
          "country": "Ghana",
          "region": "region",
          "state": "state",
          "city": "city",
          "suburb": "suburb",
          "landmark": "landmark",
          "areacode": "areacode",
          "isPrimary": true
        },
        "otherWellnessGoals": [""],
        "bankCards": {
          "cardNumber": "0000",
          "expiration": '2007-12-03',
          "cvc": "",
          "isMain": true
        },
        "momoAccounts": {
          "momoNumber": "000",
          "accountName": fname.value.value,
          "network": "VODAFONE",
          "isMain": true
        }
      },
      "token": token
    };

    _globalController.apiCallController(
      function: (val) async {
        String message = val['responseMessage'];

        CustomSnackBars().successSnackBar(
          title: 'Success',
          message: message,
        );
        // UserProfileModel user = UserProfileModel.fromJson(val);
        // await _globalController.updateUser(user);
        await AuthController().getCurrentUser();

        fun();
      },
      variable: profile,
      query: _profilemutations.addProfile(),
      showLoader: true,
      showError: false,
      key: 'addProfile',
      loadingMessage: "Registering user...",
    );
  }

  updateProfile({
    required dynamic data,
    required Function() fun,
  }) async {
    _globalController.apiCallController(
      function: (val) {
        String message = val['responseMessage'];
        CustomSnackBars().successSnackBar(
          title: 'Success',
          message: message,
        );
        fun();
      },
      variable: {
        "profile": data,
        "token": token,
        "id": userData['id'],
      },
      query: _profilemutations.updateProfile(),
      showLoader: true,
      showError: false,
      key: 'updateProfile',
      loadingMessage: "Registering user...",
    );
  }
}
