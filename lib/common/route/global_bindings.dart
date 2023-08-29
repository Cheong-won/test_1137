import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/base/test_service.dart';
import '../../controller/login_controller.dart';
import '../../controller/record_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.putAsync<TestService>(() => TestService().init());
    Get.put(RecordController());
    Get.put(LoginController());

  }

}