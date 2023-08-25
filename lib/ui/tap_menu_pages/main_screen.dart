import 'package:fittrix/ui/tap_menu_pages/video_screen.dart';
import 'package:fittrix/ui/tap_menu_pages/view_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../common/sub_menu_widget.dart';
import 'login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final GlobalKey bottomNavigationKey = GlobalKey();
  var logger = Logger();
  var selectedIndex = 0;
  double iconYPosition = 0;
  double iconXPosition = 0;

  static final List<String> _titles = <String>[
    'tab_menu1'.tr,
    'tab_menu2'.tr,
  ];
  static const List<Widget> widgetOptions = <Widget>[
    ViewRecord(),
    ViewRecord(),
    Login(),
  ];

  @override
  void initState() {
    super.initState();

  }

  void _onItemTapped(int index) {
    logger.i('onItemTapped: $index');

    setState(() {
      selectedIndex = index;
      final RenderBox renderBox = bottomNavigationKey.currentContext!.findRenderObject() as RenderBox;
      final double iconWidth = renderBox.size.width / 3;  // 3개의 아이콘

      // 선택된 아이콘의 중앙 x 위치를 계산
      iconXPosition = (iconWidth * index) + (iconWidth / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 너비



    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        key: bottomNavigationKey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'tab_menu1'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.open_in_new_rounded),
            label: 'tab_menu2'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.open_in_new_rounded),
            label: 'tab_menu3'.tr,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Stack(
        children: [
          // 컨텐츠 내용
          Container(
            alignment: Alignment.center,
            child: widgetOptions.elementAt(selectedIndex),
          ),
          Positioned(
            left: iconXPosition,
            bottom: 0.h,
            child: SubMenuWidget(
              onTapSubMenu: (index) {
                setState(() {
                  logger.d('onTapSubMenu: $index');
                });
              },
            ),
          ),
        ],
      ),
    );



  }
}
