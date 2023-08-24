 import 'dart:async';
import 'package:injectable/injectable.dart';
import '../models/request/user_info.dart';
import '../services/auth_service_api.dart';

 abstract class AuthRepository{

   Future<String>? login(UserInfo userInfo);

 }

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthServiceAPI? api;
  AuthRepositoryImpl({required this.api});

  @override
  Future<String>? login(userInfo) {
    // TODO: implement login
    throw UnimplementedError();
  }


}