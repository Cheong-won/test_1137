import 'package:get/get.dart';
import '../../di/di.dart';
import '../../ui/splash/splash.dart';
import '../../ui/tap_menu_pages/main_screen.dart';
import '../preference/preference.dart';


abstract class Routes {
  static const splash = '/splash';
  static const mainScreen = '/mainScreen';

}

final appPages = [
  GetPage(name: Routes.splash, page:() => SplashScreen()),
  GetPage(name: Routes.mainScreen, page:() => const MainScreen()),


];

class RoutesHelper{
  static final pref =getIt<Preference>();

}
