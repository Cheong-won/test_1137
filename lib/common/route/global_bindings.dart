import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/auth_controller.dart';
import '../../controller/base/test_service.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    GetStorage.init();
    Get.putAsync<TestService>(() => TestService().init());
    Get.put(AuthController());

  }

}