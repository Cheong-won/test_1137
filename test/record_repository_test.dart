import 'package:fittrix/models/response/record_item.dart';
import 'package:fittrix/repository/record_repository.dart';
import 'package:fittrix/services/record_service_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'record_repository_test.mocks.dart';

@GenerateMocks([RecordServiceAPI])
void main() {
  late RecordServiceAPI mockApi;
  late RecordRepository repository;

  setUp(() {
    mockApi = MockRecordServiceAPI();
    repository = RecordRepositoryImpl(api: mockApi);
  });

  test('Fetch records successfully', () async {
    // Prepare mock API response
    when(mockApi.getRecords()).thenAnswer(
          (_) async => [
        RecordItem(1628707200, 'This is the first description', '1234'),
        RecordItem(1628793600, 'This is the second description', '5678'),
      ],
    );

    final records = await repository.records();
    expect(records, isNotNull);
    expect(records!.length, 2);
  });

  test('Fetch records throws exception', () async {
    // Prepare mock to throw exception
    when(mockApi.getRecords()).thenThrow(Exception('An error occurred'));

    // Check if the method properly catches exceptions and returns null
    final records = await repository.records();
    expect(records, isNull);
  });
}
