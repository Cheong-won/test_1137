import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TestNavigator{
  //새 화면으로 이동:
  static void to(StatelessWidget page){
    Get.to(page);
  }

  //새 화면으로 이동: by 이름으로
  static void toNamed(String page){
    Get.toNamed(page);
  }
  //새 화면으로 이동: by 이름으로
  static void toNamedWithArgument(String page, dynamic arguments){
    Get.toNamed(page, arguments: arguments);
  }


  //snackbars, dialogs, bottomsheets 또는 Navigator.pop(context);로 보통 닫았던 것들을 닫기
  static void back(){
    Get.back();
  }

  //다음 화면으로 이동하고 이전 화면에서 돌아오지 않는 경우 (스플래시나 로그인 화면 등을 사용하는 경우)
  static void offWithArgument(String page, dynamic arguments){
    Get.offNamed(page, arguments: arguments);
  }

  //다음 화면으로 이동하고 이전 화면에서 돌아오지 않는 경우 (스플래시나 로그인 화면 등을 사용하는 경우)
  static void off(String page){
    Get.offNamed(page);
  }

  //다음 화면으로 이동하고 이전 화면이 모두 닫히는 경우 (장바구니, 투표, 테스트에 유용함)
  static void offAll(String page){

    Get.offAllNamed(page);
  }

  static void offAllWithArgument(String page, dynamic arguments){
    Get.offAllNamed(page, arguments: arguments);
  }

}

