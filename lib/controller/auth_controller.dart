import '../../di/di.dart';
import '../repository/auth_repository.dart';
import 'base/base_controller.dart';

class AuthController extends BaseController {
  final AuthRepository _repository = getIt<AuthRepository>();


}
