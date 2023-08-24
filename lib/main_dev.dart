import 'package:fittrix/setup_env.dart';
import 'di/env/build_config.dart';
const env = String.fromEnvironment('env', defaultValue:  CustomEnv.dev);

@pragma('vm:entry-point')
Future<void> main() async {
  SetupEnv(env);
}



