import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import '../../common/preference/preference.dart';
import '../../common/route/test_navigator.dart';
import '../../common/route/test_router.dart';
import '../../controller/auth_controller.dart';
import '../../di/di.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  final _authCnt = Get.find<AuthController>();
  var logger = Logger();
  bool versionCheck = true;
  bool implCompleted = false;
  double aspectRatio = 0;
  static const TIMEOUT_TIME = 2 * 1000;

  @override
  void initState() {
    var pref = getIt<Preference>();
    super.initState();
    // 3초 후에 _navigateToNextScreen 함수를 호출
    Future.delayed(Duration(seconds: 3), () {
      _navigateToNextScreen(context);
    });
  }

  _navigateToNextScreen(BuildContext context) {
    TestNavigator.toNamed(Routes.mainScreen);
  }

  void _goNextPage() {
  }

  @override
  void dispose() {
    super.dispose();
  }


  void _refresh() {
    setState(() {});
  }

  double _getWidth() {
    logger.d("size : ${MediaQuery.of(context).size}");
    return (MediaQuery.of(context).size.width > 375.0) ? 375 : MediaQuery.of(context).size.width;
  }

  double _getHeight() {
    return (MediaQuery.of(context).size.height > 812.0) ? 812 : MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.bottomCenter,
        child:   Container(
                color: Colors.white,
              ),
      ),
    );
  }
}
