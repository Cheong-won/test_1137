import 'package:injectable/injectable.dart';

import 'build_config.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.prod])
class BuildConfigProd extends BuildConfig {
  @override
  String get host => 'https://.../';

  @override
  String get hostSocketIO => 'wss://...';

  @override
  String get flavor => CustomEnv.prod;
}
