import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/response/record_item.dart';
part 'record_service_api.g.dart';

@RestApi()
abstract class RecordServiceAPI {
  factory RecordServiceAPI(Dio dio, {String baseUrl}) = _RecordServiceAPI;

  @GET('/records/')
  Future<List<RecordItem>>? getRecords();

}
