import 'package:fittrix/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'common/def/const.dart';
import 'common/languages/languages.dart';
import 'common/route/global_bindings.dart';
import 'common/route/test_router.dart';
import 'common/style/app_theme.dart';
import 'common/util/device_info.dart';
import 'common/util/global_device_event_manager.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);
  static String deviceType = 'IOS';

  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication>
    with WidgetsBindingObserver {
  var logger = Logger();


  @override
  void initState() {
    initServices();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  /// inactive - The application is in an inactive state and is not receiving user input. iOS only
  /// paused - The application is not currently visible to the user, not responding to user input, and running in the background.
  /// resumed - The application is visible and responding to user input.
  /// suspending - The application will be suspended momentarily. Android only
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  initServices() async {
    _dumpSystemInfo();

  }


  void _dumpSystemInfo() async {
     DeviceInfo.getDeviceInfo().then((value) {
       logger.d("OS : ${MainApplication.deviceType}");
     });


         //상단 상태 표시줄 높이 double Ex> 24.0

  }


  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
     statusBarColor: Colors.transparent, // 투명색
     statusBarIconBrightness: Brightness.dark
   ));
   return ScreenUtilInit(
     //기본 해상도 설정 (375 * 812)기준
     designSize: const Size(375, 812),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (context , child) {
       //디바이스 이벤트 설정 (ex : network 끊김)
       GlobalDeviceEventManager();
       return GetMaterialApp(
         initialBinding: GlobalBindings(),
         smartManagement: SmartManagement.onlyBuilder,
         scaffoldMessengerKey: rootScaffoldMessengerKey,
         //테마 설정
         theme: ThemeData(
           fontFamily: TestConst.fontFamily,
           brightness: Brightness.light,
           primaryColor: AppTheme.mainColor,
           splashColor: AppTheme.mainColor,
           visualDensity: VisualDensity.adaptivePlatformDensity,

         ),
         localizationsDelegates: const [
           GlobalMaterialLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate,

         ],
         //언어 설정
         translations: Languages(),
         fallbackLocale: const Locale('ko', 'KR'),
         debugShowCheckedModeBanner: false,
         locale: Get.deviceLocale,
         getPages: appPages,
         initialRoute: Routes.mainScreen,

       );
     },
     child: SplashScreen(),
   );
  }
}
