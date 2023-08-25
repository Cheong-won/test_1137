import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'tab_menu1': '운동 기록',
          'tab_menu2': '기록 보기',
          'tab_menu2': '로그인',
          'tab1_title': 'tab_menu1'.tr,
          'tab2_title': 'tab_menu2'.tr,
          'sub_menu1' : 'sub_menu1',
          'sub_menu1' : 'sub_menu2',
          'sub_menu1' : 'sub_menu3',
          'sub_menu1' : 'sub_menu4',
          'login': '로그인',
          'login_id': '아이디',
          'enter_your_id': '아이디를 입력해주세요.',
          'login_password': '비밀번호',
          'enter_your_password': '비밀번호를 입력해주세요.',
          'login_button': '로그인',
          'login_cancel': '취소',
          'login_error': '아이디 또는 비밀번호가 일치하지 않습니다.',


        },

        // 'en_US':
        //
        // },
      };
}
