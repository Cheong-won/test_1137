import 'package:fittrix/di/di.dart';
import 'package:get/get.dart';

import '../common/preference/preference.dart';
import 'base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  var isLoggedIn = false.obs; // Reactive 상태
  final Preference _preference = getIt.get<Preference>();

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = _preference.read(PreferenceType.isLogin) ?? false;
  }

  Future<bool> login(String password) async {
    if (password == '12345') {
      isLoggedIn.value = true;
      _preference.write(PreferenceType.isLogin, true);
      _preference.isLogin = true;
      return true;
    }
    return false;
  }
  void logout(){
    isLoggedIn.value = false;
    _preference.write(PreferenceType.isLogin, false);
  }
}
