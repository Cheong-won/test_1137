import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'auth_service_api.g.dart';

@RestApi()
abstract class AuthServiceAPI {
  factory AuthServiceAPI(Dio dio, {String baseUrl}) = _AuthServiceAPI;
}
