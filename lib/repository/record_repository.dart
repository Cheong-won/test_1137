
import 'package:fittrix/models/response/record_item.dart';
import 'package:injectable/injectable.dart';
import '../services/record_service_api.dart';

 abstract class RecordRepository{

   Future<List<RecordItem>>? records();

 }

@Injectable(as: RecordRepository)
class RecordRepositoryImpl implements RecordRepository{
  RecordServiceAPI api;
  RecordRepositoryImpl({required this.api});

  @override
  Future<List<RecordItem>>? records() {
    return api.getRecords();
  }


}