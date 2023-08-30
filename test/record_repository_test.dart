import 'package:fittrix/repository/record_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fittrix/models/response/record_item.dart';
import 'package:fittrix/services/record_service_api.dart';

class MockRecordServiceAPI extends Mock implements RecordServiceAPI {
}

void main() {
  late RecordServiceAPI api;
  late RecordRepository repository;

  setUp(() {
    api = MockRecordServiceAPI();
    repository = RecordRepositoryImpl(api: api);
  });

  test('Fetch records successfully', () async {
    // Prepare mock API response
    when(api.getRecords()).thenAnswer(
          (_) async => [
       RecordItem(1628707200, 'This is the first description', '1234'),
       RecordItem(1628793600, 'This is the second description', '5678')
      ]
    );


    final records = await repository.records();
    expect(records, isNotNull); // 이 줄 추가
    expect(records!.length, 2);
  });
}
