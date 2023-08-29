import 'package:fittrix/di/di.dart';
import 'package:get/get.dart';

import '../common/preference/preference.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs; // Reactive 상태
  final Preference _preference = getIt.get<Preference>();

  Future<bool> login(String password) async {
    if (password == '12345') {
      isLoggedIn.value = true;
      _preference.write(PreferenceType.isLogin, true);
      return true;
    }
    return false;
  }
}
