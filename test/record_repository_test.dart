import 'package:fittrix/di/db/database.dart';
import 'package:fittrix/models/response/record_item.dart';
import 'package:fittrix/repository/record_repository.dart';
import 'package:fittrix/services/record_service_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'record_repository_test.mocks.dart';

@GenerateMocks([RecordServiceAPI, FittrixDatabase])
void main() {
  late RecordServiceAPI mockApi;
  late FittrixDatabase mockDatabase;
  late RecordRepository repository;

  setUp(() {
    mockApi = MockRecordServiceAPI();
    mockDatabase = MockFittrixDatabase();
    repository = RecordRepositoryImpl(api: mockApi, database: mockDatabase);
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

  test('Insert record into database', () async {
    const record = Record(
      desc: 'Sample Description',
    );

    var item = record.toCompanion(true);
    // Set up the mock database to expect an insert call
    when(mockDatabase.addRecord(item)).thenAnswer((_) async => 1);

    await repository.insertRecord(record);

    // Verify that the insert method was called with the correct record
    verify(mockDatabase.addRecord(item));
  });
}
