import '../../di/di.dart';
import '../models/response/record_item.dart';
import '../repository/record_repository.dart';
import 'base/base_controller.dart';

class RecordController extends BaseController {
  final RecordRepository _repository = getIt<RecordRepository>();

  Future<List<RecordItem>>? records() {
    return _repository.records();
  }


}
