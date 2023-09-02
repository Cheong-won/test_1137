import 'package:fittrix/view_models/login_view_model.dart';
import 'package:fittrix/view_models/record_view_model.dart';
import 'package:get/get.dart';


class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RecordViewModel());
    Get.put(LoginViewModel());

  }

}