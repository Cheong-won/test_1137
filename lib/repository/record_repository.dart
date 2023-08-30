
import 'package:fittrix/models/response/record_item.dart';
import 'package:injectable/injectable.dart';
import '../services/record_service_api.dart';

 abstract class RecordRepository{

   Future<List<RecordItem>?> records();

 }

@Injectable(as: RecordRepository)
class RecordRepositoryImpl implements RecordRepository{
  RecordServiceAPI api;
  RecordRepositoryImpl({required this.api});

  @override
  Future<List<RecordItem>?> records() async {
    try {
      return await api.getRecords();
    } catch (e) {
      // 예외 처리 로직
      return null; // 또는 적절한 예외를 던지거나, 에러를 기록합니다.
    }
  }

}