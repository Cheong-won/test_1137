import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../ui/common/common_dialog_wihtout_title_onebtn.dart';

class DialogUtil {
  static var logger = Logger();
  static double dialogCircular = 10;


  static void showGetNetworkErrorPopup() async {
    var data = await Get.dialog(
      CommonDialogWithoutTitleOneBtn(
        titleStart: "",
        titleMiddle: "",
        titleEnd: '',
        isTwolineContents: false,
        contents: 'check_network'.tr,
        buttonText1: 'confirm'.tr,
      ),
    );
    logger.d("data: $data");
    SystemNavigator.pop();
  }

}
