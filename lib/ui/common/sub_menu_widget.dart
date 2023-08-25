import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubMenuWidget extends StatelessWidget {
  final Function(int) onTapSubMenu; // 선택된 서브 메뉴의 인덱스를 전달하는 콜백

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
            _buildListTile('sub_menu1'.tr, 1),
            _buildDivider(),
            _buildListTile('sub_menu2'.tr, 1),
            _buildDivider(),
            _buildListTile('sub_menu3'.tr, 1),
            _buildDivider(),
            _buildListTile('sub_menu4'.tr, 1),
          ],
        ));
  }


  Widget _buildDivider() {
    return Container(
      width: 100.w,
      child: Divider(color: Colors.black),
    );
  }
  Widget _buildListTile(String title, int index) {
    return Container(
      width: 100.w,  // 각 ListTile의 너비를 100으로 설정
      child: ListTile(
        title: Text(title),
        onTap: () => onTapSubMenu(index),
      ),
    );
  }
}
