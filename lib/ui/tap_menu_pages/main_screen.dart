import 'package:fittrix/ui/tap_menu_pages/video_screen.dart';
import 'package:fittrix/ui/tap_menu_pages/view_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  var logger = Logger();
  var selectedIndex = 0;
  static final List<String> _titles = <String>[
  'tab_menu1'.tr,
  'tab_menu2'.tr,
  ];
  static const List<Widget> widgetOptions = <Widget>[
    VideoScreen(),
    ViewRecord(),
    Login(),
  ];

  void _onItemTapped(int index) {
    logger.i('onItemTapped: $index');

    setState(() {
      selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
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

        body: Container(
          alignment: Alignment.center,
          child: widgetOptions.elementAt(selectedIndex),
        )
    );
  }
}
