import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
enum SubMenuIndex {
  first, // 첫 번째 하위 메뉴
  second, // 두 번째 하위 메뉴
  third, // 세 번째 하위 메뉴
  fourth,
  none// 네 번째 하위 메뉴
}

class SubMenuWidget extends StatelessWidget {
  final Function(SubMenuIndex) onTapSubMenu; // 선택된 서브 메뉴의 인덱스를 전달하는 콜백

  const SubMenuWidget({super.key, required this.onTapSubMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Column 전체에 아웃라인 추가
          color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildListTile('sub_menu1'.tr, SubMenuIndex.first),
            _buildDivider(),
            _buildListTile('sub_menu2'.tr, SubMenuIndex.second),
            _buildDivider(),
            _buildListTile('sub_menu3'.tr, SubMenuIndex.third),
            _buildDivider(),
            _buildListTile('sub_menu4'.tr, SubMenuIndex.fourth),
          ],
        ));
  }


  Widget _buildDivider() {
    return Container(
      width: 100.w,
      child: const Divider(color: Colors.black),
    );
  }
  Widget _buildListTile(String title, SubMenuIndex index) {
    return SizedBox(
      width: 100.w,  // 각 ListTile의 너비를 100으로 설정
      child: ListTile(
        title: Text(title),
        onTap: () => onTapSubMenu(index),
      ),
    );
  }
}
