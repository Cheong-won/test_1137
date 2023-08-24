import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

class NetworkChecker{
  static var logger = Logger();


  static Future<bool> isNetworkConnected() async{
    late ConnectivityResult connectivityResult;
    try{
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        return true;
      } else {
        return false;
      }
    } catch(e){
      logger.d(e.toString());
      return false;
    }

  }
}