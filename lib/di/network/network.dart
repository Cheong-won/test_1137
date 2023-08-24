import 'package:connectivity_plus/connectivity_plus.dart';

startNetworkChecking() async {
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      //TODO Something
    }
  });
}
