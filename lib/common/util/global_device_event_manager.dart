import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'dialog_util.dart';

class GlobalDeviceEventManager with ChangeNotifier{
  late bool _isOnline;
  late BuildContext _context;
  bool get isOnline => _isOnline;

  GlobalDeviceEventManager(){
    Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none){
        _isOnline = false;
        notifyListeners();
        DialogUtil.showGetNetworkErrorPopup();
      } else {
        _isOnline = true;
        notifyListeners();
      }

    });
  }
}