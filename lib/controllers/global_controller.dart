import 'dart:developer';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mhc_customer/util/exports.dart';

class GlobalController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxString errorMessage = ''.obs;
  var userProfile = UserProfileModel().obs;

  RxBool isConnected = false.obs;
  RxBool isDarkMode = false.obs;

  updateUser(UserProfileModel profile) {
    log("U[date---->");
    print("update data---> " + profile.toJson().toString());
    userProfile.value = profile;
  }

  Future<void> apiCallController({
    required Function(dynamic) function,
    Map<String, dynamic>? variable,
    required String query,
    String? key,
    bool showLoader = true,
    bool showError = true,
    required String loadingMessage,
  }) async {
    try {
      isLoading.value = true;
      if (showLoader) {
        Get.closeCurrentSnackbar();
        CustomSnackBars()
            .loadingSnackBar(title: 'Please Wait', message: loadingMessage);
      }
      log('$variable');
      final bool hasInternet = await internetCheck();
      hasError.value = false;
      if (hasInternet) {
        HttpLink httplink = HttpLink(Constants.endpoint);
        final client = GraphQLClient(link: httplink, cache: GraphQLCache());
        var result = await client.query(
          QueryOptions(document: gql(query), variables: variable ?? {}),
        );
        log("------------variable----------");
        log(variable.toString());

        if (result.hasException) {
          log("-------------exception---------------");
          log(result.exception!.toString());
          CustomSnackBars().errorSnackBar(
            title: 'Error',
            message: 'Opps, something went wrong',
          );
        } else {
          log("-------------response---------------");
          log(result.data!.toString());
          ApiResponse _response =
              ApiResponse.fromJson(result.data!['$key']['responseStatus']);

          //handling errors
          if (_response.isError!) {
            String message = result.data!['$key']["responseMessage"];

            //show dialoage error
            if (showError) {
              CustomSnackBars().errorSnackBar(
                title: 'Error',
                message: message,
              );
            } else {
              hasError.value = true;
              errorMessage.value = message;
            }
          } else {
            function(result.data!['$key']);
          }
        }
      } else {
        CustomSnackBars().infoSnackBar(
          title: 'Connection Error',
          message: 'No internet connection',
        );
      }
    } catch (e) {
      log("Error " + e.toString());
      if (!showError) {
        CustomSnackBars().errorSnackBar(
          title: 'Error',
          message: e.toString(),
        );
      }
    } finally {
      isLoading.value = false;

      if (showLoader) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}

T removeTypename<T>(T data) => _removeUnwantedKeys(data, ['__typename']);

T _removeUnwantedKeys<T>(T data, List keysToRemove) {
  if (data is Map && data.containsAnyOf(keysToRemove)) {
    Map d = {};
    data.forEach((key, value) {
      if (!keysToRemove.contains(key)) {
        d[key] = _removeUnwantedKeys(value, keysToRemove);
      }
    });
    return d as T;
  } else if (data is List) {
    return data.map((c) => _removeUnwantedKeys(c, keysToRemove)).toList() as T;
  } else {
    return data;
  }
}

extension MapsMadeEasy<U, V> on Map<U, V>? {
  bool containsAnyOf(List keys) {
    if (this == null) return false;

    return this!.entries.any((element) => keys.contains(element.key));
  }
}
