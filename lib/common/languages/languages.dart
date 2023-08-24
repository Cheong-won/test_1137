import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'tab_menu1': 'Chat',
          'tab_menu2': 'My',
          'tab1_title': 'tab_menu1'.tr,
          'tab2_title': 'tab_menu2'.tr,
        },

        // 'en_US':
        //
        // },
      };
}
