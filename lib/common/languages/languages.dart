import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'tab_menu1': '운동 기록 하기',
          'tab_menu2': '운동 기록 보기',
          'tab_menu3': '로그인',
          'tab1_title': 'tab_menu1'.tr,
          'tab2_title': 'tab_menu2'.tr,
          'sub_menu1' : '런지',
          'sub_menu2' : '스쿼트',
          'sub_menu3' : '푸시업',
          'sub_menu4' : '레그 레이즈',
          'login': '로그인',
          'logout': '로그아웃',
          'login_id': '아이디',
          'enter_your_id': '아이디를 입력해주세요.',
          'login_password': '비밀번호',
          'enter_your_password': '비밀번호를 입력해주세요.',
          'login_button': '로그인',
          'login_cancel': '취소',
          'login_error': '아이디 또는 비밀번호가 일치하지 않습니다.',
          'Exercise_photo_select': '운동사진 선택하기',
          'simple_status_message_input': '간단한 상태 메세지 입력',
          'exercise_date': '운동 일자',
          'record': '기록하기',

        },

        // 'en_US':
        //
        // },
      };
}
