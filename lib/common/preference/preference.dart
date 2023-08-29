import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';


enum PreferenceType {
  undefined("undefined"),
  isLogin("login");

  const PreferenceType(this.value);

  final String value;

  factory PreferenceType.getByCode(String typeValue){
    return PreferenceType.values.firstWhere((value) => value.value == typeValue,
        orElse: () => PreferenceType.undefined);
  }
}

@singleton
class Preference  {
  //const define
  bool isFirstLaunch = false;
  var logger = Logger();
  static const String DefaultValue = "";

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
    GetStorage().write(key.name, value);
  }

  dynamic read(PreferenceType key){
    return GetStorage().read(key.name);
  }

  void logout(){
    var storage = GetStorage();
  }
}