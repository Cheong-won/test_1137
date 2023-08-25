import 'package:fittrix/ui/tap_menu_pages/video_screen.dart';
import 'package:fittrix/ui/tap_menu_pages/view_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../common/sub_menu_widget.dart';
import 'create_record.dart';
import 'login.dart';
import 'login_widget.dart';

enum ScreenType {
  video,
  createRecord,
  viewRecord
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> with WidgetsBindingObserver {
  GlobalKey bottomNavigationKey = GlobalKey();
  var logger = Logger();
  var selectedIndex = 0;
  double _iconXPosition = 0;
  bool _showSubMenu = false;
  ScreenType currentScreenType = ScreenType.video;
  SubMenuIndex subMenuIndex = SubMenuIndex.none;
  bool isKeyboardVisible = false;

  static final List<String> _titles = <String>[
    'tab_menu1'.tr,
    'tab_menu2'.tr,
  ];
  static const List<Widget> widgetOptions = <Widget>[
    Login(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = MediaQuery.of(context).viewInsets.bottom;
    if (isKeyboardVisible == (value != 0)) {
      return;
    }
    if (value != 0) {
      setState(() => isKeyboardVisible = true);
    } else {
      setState(() => isKeyboardVisible = false);
    }
    logger.d('isKeyboardVisible: $isKeyboardVisible');
  }
  void _setCurrentScreen(ScreenType screenType) {
    setState(() {
      currentScreenType = screenType;
    });
  }

  Widget _getCurrentScreen() {
    switch (currentScreenType) {
      case ScreenType.video:
        return const VideoScreen();
      case ScreenType.createRecord:
        return CreateRecord(onBackButtonPressed: () {
          setState(() {
            _setCurrentScreen(ScreenType.video);
          });
        }, subMenuIndex: subMenuIndex);
      case ScreenType.viewRecord:
        return ViewRecord(onBackButtonPressed: () {
          setState(() {
            _setCurrentScreen(ScreenType.video);
          });
        }, subMenuIndex: subMenuIndex);
      default:
        logger.w('Invalid screen type: $currentScreenType');
        return const SizedBox(); // 혹은 다른 기본 위젯
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0 || index == 1) {
        if (selectedIndex == index) {
          // 동일한 탭이 다시 선택되면 서브 메뉴 표시를 토글
          _showSubMenu = !_showSubMenu;
        } else {
          _showSubMenu = true;
        }
        selectedIndex = index;

        final RenderBox renderBox = bottomNavigationKey.currentContext!.findRenderObject() as RenderBox;
        final double iconWidth = renderBox.size.width / 3;

        _iconXPosition = (iconWidth * index) + (iconWidth / 2);
      } else {
        // 첫 번째 또는 두 번째 탭이 아닌 경우에는 서브 메뉴를 숨김
        _showSubMenu = false;
        selectedIndex = index;
        if (index == 2) {
          _showLoginPopup(context);
          return;
        }
      }
    });
  }

  void _handleSubMenuTap(SubMenuIndex subMenuIndex) {
    setState(() {
      if (selectedIndex == 0) {
        // 첫 번째 탭의 하위 메뉴 선택시
        _setCurrentScreen(ScreenType.createRecord);
      } else if (selectedIndex == 1) {
        // 두 번째 탭의 하위 메뉴 선택시
        _setCurrentScreen(ScreenType.viewRecord);
      }
      _showSubMenu = false;
    });
  }
  void _showLoginPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: (currentScreenType == ScreenType.video && !isKeyboardVisible)
         ? BottomNavigationBar(
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
        ): null,
        body: Stack(
          children: [
            // 컨텐츠 내용
            Container(
              alignment: Alignment.center,
              child: _getCurrentScreen(),
            ),
            if (_showSubMenu)
              Positioned(
                left: _iconXPosition,
                bottom: 0.h,
                child: SubMenuWidget(
                  onTapSubMenu: (subMenuIndex) {
                    setState(() {
                      logger.d('onTapSubMenu: $subMenuIndex');
                      _handleSubMenuTap(subMenuIndex);
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
