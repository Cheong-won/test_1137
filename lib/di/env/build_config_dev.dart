import 'package:injectable/injectable.dart';

import 'build_config.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.dev])
class BuildConfigDev extends BuildConfig {
  @override
  String get host => 'https://cnfb9xo8n9.execute-api.ap-northeast-2.amazonaws.com/dev/v1';

  @override
  String get hostSocketIO => 'wss://...';

  @override
  String get flavor => CustomEnv.dev;
}
