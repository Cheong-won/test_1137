import 'package:drift/drift.dart';

@DataClassName('Record')
class Records extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get desc => text().named('body')();
  ColumnBuilder<DateTime> get createDate =>
      dateTime().clientDefault(() => DateTime.now()); // 현재 시간으로 저장

}
