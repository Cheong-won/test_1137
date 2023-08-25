import 'package:injectable/injectable.dart';

import 'build_config.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.dev])
class BuildConfigDev extends BuildConfig {
  @override
  String get host => 'https://64e6bddc09e64530d18033a5.mockapi.io/v1/';

  @override
  String get hostSocketIO => 'wss://...';

  @override
  String get flavor => CustomEnv.dev;
}
