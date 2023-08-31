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
  bool isFirstLaunch = false;
  var logger = Logger();
  static const String DefaultValue = "";
  final storage = GetStorage();

  Preference(){
    init();
  }

  Future<Preference> init() async {
    var first = read(PreferenceType.isLogin);
    if ( first == null){
      write(PreferenceType.isLogin, true);
    }
    isFirstLaunch = read(PreferenceType.isLogin);

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
  }
}