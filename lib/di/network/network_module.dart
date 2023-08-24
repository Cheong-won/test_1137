import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../common/preference/preference.dart';
import '../../common/util/pretty_dio_logger.dart';
import '../../services/auth_service_api.dart';
import '../di.dart';
import '../env/build_config.dart';

@module
abstract class NetworkModule {
  @injectable
  Dio get dio {
    var logger = Logger();
    var pref = getIt<Preference>();
    final Dio dio = Dio();

    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options);
    }, onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        var refreshDio = Dio();
        refreshDio.interceptors.clear();
        refreshDio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            //고민을 해봐야 될부분.(본인 인증 페이지로 이동 필요)
            var pref = getIt<Preference>();
            pref.logout();
          }
          return handler.next(error);
        }));



        final clonedRequest = await dio.request(
            getIt<BuildConfig>().apiUrl + error.requestOptions.path,
            options:
                Options(method: error.requestOptions.method, headers: error.requestOptions.headers),
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters);

        return handler.resolve(clonedRequest);
      }
      return handler.next(error);
    }));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: false,
        compact: false,
        maxWidth: 90));
    return dio;
  }

  @injectable
  AuthServiceAPI get authSvc {
    return AuthServiceAPI(
      getIt<Dio>(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }
}
