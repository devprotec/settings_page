import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> internetCheck() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  if (result == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}
