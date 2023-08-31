import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';


enum PreferenceType {
  undefined,
  isLogin;
}

@singleton
class Preference  {
  //const define
  bool isLogin = false;
  var logger = Logger();
  final storage = GetStorage();

  Preference(){
    init();
  }

  Future<Preference> init() async {
    var first = read(PreferenceType.isLogin);
    if ( first == null){
      write(PreferenceType.isLogin, true);
    }
    isLogin = read(PreferenceType.isLogin);

    return this;
  }

  void write(PreferenceType key, dynamic value) {
    storage.write(key.name, value);
  }

  dynamic read(PreferenceType key){
    return storage.read(key.name);
  }

  void logout(){
    storage.erase();
    isLogin = false;
  }
}