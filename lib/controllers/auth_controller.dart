import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//import 'package:mhc_consumer/models/profile.dart';
//import 'package:mhc_consumer/utils/constants.dart';
import '../screens/auth/reset_succes.dart';
import '../graphql/mutations/auth_mutation.dart';
import '../graphql/queries/auth_queries.dart';
import '../graphql/queries/user_queries.dart';
//import '../screens/auth/reset_succes.dart';
import '../models/profile.dart';
import '../screens/on_boarding/screens/welcome.dart';
import '../screens/home/landing_page.dart';
//import '../screens/on_boarding/screens/welcome.dart';
import '../util/constants.dart';
import '../widgets/snackbars.dart';
import 'global_controller.dart';

class AuthController extends GetxController {
  var isLoggingIn = false.obs;
  var isGettingUser = false.obs;
  final _token = ''.obs;

  var isFormFieldsEnabled = true.obs;
  var hasError = false.obs;

  final httpLink = HttpLink(Constants.endpoint);
  final AuthQueries _queries = AuthQueries();
  final UserQueries _userqueries = UserQueries();
  final AuthMutations _mutations = AuthMutations();
  final GlobalController _globalController = Get.put(GlobalController());

  logIn({required String email, required String password,}) async {
    await _globalController.apiCallController(
      function: (val) async {
        token = val['access'];
        refreshToken = val['refresh'];
        _token.value = val['access'];

        await getCurrentUser();
       if(_globalController.userProfile.value.profile == null) {
          Get.to(() => Welcome());
        } else {
          Get.to(() => LandingPage());
        }
       //Get.to(() =>  LandingPage());
      },
      variable: {
        "user": {"email": email, "password": password}
      },
      query: _queries.login(),
      key: 'login',
      showError: false,
      showLoader: true,
      loadingMessage: "Validating user...",
    );
  }

  _registerationlogIn({required dynamic data}) async {
    _globalController.apiCallController(
      function: (val) {
        token = val['access'];
        refreshToken = val['refresh'];

        print(userData);
        print(token);
        Get.to(const Welcome());
      },
      variable: {"user": data},
      query: _queries.login(),
      key: 'login',
      showError: false,
      showLoader: false,
      loadingMessage: "Validating user...",
    );
  }

  forgotPassword({required String email}) async {
    _globalController.apiCallController(
      function: (val) {
        Get.to(ResetSuccess(
          email: email,
        ));
      },
      variable: {
        "payload": {"email": email}
      },
      query: _mutations.forgotPassword(),
      showLoader: true,
      showError: false,
      key: 'forgotPassword',
      loadingMessage: "Validating user...",
    );
  }

  resendVerification({required String email}) async {
    _globalController.apiCallController(
      function: (val) {
        String message = val['responseMessage'];
        CustomSnackBars().successSnackBar(
          title: 'Success',
          message: message,
        );
      },
      variable: {
        "payload": {"email": email}
      },
      query: _mutations.resendVerification(),
      showLoader: false,
      showError: false,
      key: 'resendVerification',
      loadingMessage: "Resending verification...",
    );
  }

  resetPassword({required String password}) async {
    _globalController.apiCallController(
      function: (val) {},
      variable: {
        "payload": {"uid": "", "token": token, "new_password": password}
      },
      query: _mutations.resetPassword(),
      showLoader: false,
      loadingMessage: "Reseting password...",
    );
  }

  verifyAccount({required String password}) async {
    _globalController.apiCallController(
      function: (val) {},
      variable: {
        "payload": {"uid": "", "token": ""}
      },
      query: _mutations.verifyAccount(),
      showLoader: false,
      loadingMessage: "Verifying account...",
    );
  }

  register({
    required dynamic data,
  }) async {
    _globalController.apiCallController(
      function: (val) {
        String message = val['responseMessage'];
        CustomSnackBars().successSnackBar(
          title: 'Success',
          message: message,
        );
        userId = val['userId'];
        userData = val;
        _registerationlogIn(data: data);
      },
      variable: {"user": data},
      query: _mutations.register(),
      showLoader: true,
      showError: false,
      key: 'register',
      loadingMessage: "Registering user...",
    );
  }

  getCurrentUser() async {
    await _globalController.apiCallController(
      function: (val) {
        UserProfileModel user = UserProfileModel.fromJson(val);

        print(user.toJson().toString());
        _globalController.userProfile.value = user;
      },
      variable: {"token": _token.value.isNotEmpty ? _token.value : token},
      query: _userqueries.currentUser(),
      key: 'getCurrentUser',
      showError: false,
      showLoader: false,
      loadingMessage: "Fetching user...",
    );
  }

  updateUser({
    required dynamic data,
    bool showLoader = true,
    Function()? fun,
  }) async {
    _globalController.apiCallController(
      function: (val) {
        if (fun != null) {
          fun();
        } else {
          String message = val['responseMessage'];
          CustomSnackBars().successSnackBar(
            title: 'Success',
            message: message,
          );
          Get.to(const Welcome());
        }
      },
      variable: {
        "user": data,
        "token": token,
        "id": userData['id'],
      },
      query: _mutations.updateUser(),
      showLoader: showLoader,
      showError: false,
      key: 'updateUser',
      loadingMessage: "Updating user...",
    );
  }
}
