import 'package:fittrix/di/db/database.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../di/di.dart';
import '../models/response/record_item.dart';
import '../repository/record_repository.dart';
import 'base/base_view_model.dart';

class RecordViewModel extends BaseViewModel {
  final RecordRepository _repository = getIt<RecordRepository>();
  final _recordItems = RxList<RecordItem>([]);
  final _isLoading = RxBool(false); // isLoading을 RxBool로 선언
  final inputDesc = RxString('');

  List<RecordItem>? get recordItems => _recordItems.value;
  bool get isLoading => _isLoading.value; // isLoading의 getter


  loadRecords() async {
    _isLoading.value = true; // 데이터 로드 시작 전에 true로 설정

    var records = await _repository.records();
    if (records != null) {
      _recordItems.assignAll(records);
    }

    _isLoading.value = false; // 데이터 로드 완료 후에 false로 설정
  }


  Future<int> insertRecord(Record record) async {
    try {
      return await _repository.insertRecord(record) ?? -1;
    } catch (e) {
      // 에러 처리를 할 수 있습니다.
      logger.e(e.toString());
      return -1; // 실패한 경우 -1을 반환
    }
  }


  void updateDesc(String desc) {
    inputDesc.value = desc;
  }
}
