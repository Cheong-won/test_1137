import 'package:drift/drift.dart';

@DataClassName('Record')
class Records extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get desc => text().named('desc')();
  Column<DateTime> get createdAt => dateTime().nullable().withDefault(currentDateAndTime)();
}
