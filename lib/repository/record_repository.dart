import 'package:fittrix/di/db/database.dart';
import 'package:fittrix/models/response/record_item.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../services/record_service_api.dart';

abstract class RecordRepository {
  Future<List<RecordItem>?> records();

  Future<void> insertRecord(Record record);
}

@Injectable(as: RecordRepository)
class RecordRepositoryImpl implements RecordRepository {
  var logger = Logger();
  final RecordServiceAPI api;
  final FittrixDatabase database;

  RecordRepositoryImpl({required this.api, required this.database});

  @override
  Future<List<RecordItem>?> records() async {
    try {
      return await api.getRecords();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<int> insertRecord(Record record) async {
    var item = record.toCompanion(true);
    return await database.addRecord(item);
  }
}
