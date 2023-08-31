import 'package:fittrix/di/db/database.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../di/di.dart';
import '../models/response/record_item.dart';
import '../repository/record_repository.dart';
import 'base/base_controller.dart';

class RecordController extends BaseController {
  final RecordRepository _repository = getIt<RecordRepository>();
  final _recordItems = RxList<RecordItem>([]);
  final _isLoading = RxBool(false); // isLoading을 RxBool로 선언

  List<RecordItem>? get recordItems => _recordItems.value;
  bool get isLoading => _isLoading.value; // isLoading의 getter

  @override
  void onInit() {
    super.onInit();
  }

  loadRecords() async {
    _isLoading.value = true; // 데이터 로드 시작 전에 true로 설정

    var records = await _repository.records();
    if (records != null) {
      _recordItems.assignAll(records);
    }

    _isLoading.value = false; // 데이터 로드 완료 후에 false로 설정
  }

  void insertRecord(Record record) {
    _repository.insertRecord(record);
  }
}
