import 'package:injectable/injectable.dart';

import 'build_config.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.prod])
class BuildConfigProd extends BuildConfig {
  @override
  String get host => 'https://64e6bddc09e64530d18033a5.mockapi.io/v1/';

  @override
  String get hostSocketIO => 'wss://...';

  @override
  String get flavor => CustomEnv.prod;
}
