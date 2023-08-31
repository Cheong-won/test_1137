import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'di/di.dart';
import 'di/network/http_overrides.dart';
import 'main_application.dart';
var logger = Logger();
class SetupEnv {
  Future<void>? futureInit;
  String env = "dev";
  SetupEnv(this.env){
    _init();
  }

  _init() async {
    futureInit = _onCreate();  // Future를 변수에 저장
    // FutureBuilder를 사용하여 Future가 완료되면 화면을 그리도록 함(함수 호출시 바로 호출되어 문제가 발생)
    final StatefulWidget app = FutureBuilder(
      future: futureInit,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.green,
          );
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.transparent,
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return onCreateView();
        } else {
          return Container(
            color: Colors.transparent,
          );
        }
      },
    );

    runApp(app);
  }

  Future<void> _onInjection() async {
    configureDependencies(env: env);
  }


  Future<void> _onCreate() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    await _onInjection();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //     systemNavigationBarIconBrightness: Brightness.light));
  }

  @override
  Widget onCreateView() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return const MainApplication();
  }

}