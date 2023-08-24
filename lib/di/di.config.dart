// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:fittrix/common/preference/preference.dart' as _i10;
import 'package:fittrix/di/db/database.dart' as _i9;
import 'package:fittrix/di/env/build_config.dart' as _i5;
import 'package:fittrix/di/env/build_config_dev.dart' as _i6;
import 'package:fittrix/di/env/build_config_prod.dart' as _i7;
import 'package:fittrix/di/network/network_module.dart' as _i11;
import 'package:fittrix/repository/auth_repository.dart' as _i3;
import 'package:fittrix/services/auth_service_api.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i3.AuthRepository>(
        () => _i3.AuthRepositoryImpl(api: gh<_i4.AuthServiceAPI>()));
    gh.factory<_i4.AuthServiceAPI>(() => networkModule.authSvc);
    gh.factory<_i5.BuildConfig>(
      () => _i6.BuildConfigDev(),
      registerFor: {_dev},
    );
    gh.factory<_i5.BuildConfig>(
      () => _i7.BuildConfigProd(),
      registerFor: {_prod},
    );
    gh.factory<_i8.Dio>(() => networkModule.dio);
    gh.singleton<_i9.NiceWaterDatabase>(_i9.NiceWaterDatabase());
    gh.singleton<_i10.Preference>(_i10.Preference());
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}
