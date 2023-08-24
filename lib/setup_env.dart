import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'di/di.dart';
import 'di/env/env.dart';
import 'main_application.dart';
var logger = Logger();
class SetupEnv extends Env {
  String env = "dev";
  SetupEnv(this.env);

  @override
  Future? onInjection() async {
    configureDependencies(env: env);
  }

  @override
  FutureOr<void> onCreate() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.light,
    //     systemNavigationBarColor: AppTheme.mCInk500,
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