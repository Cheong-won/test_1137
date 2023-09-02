import 'package:drift/drift.dart';

@DataClassName('Record')
class Records extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get desc => text().named('desc')();
  DateTimeColumn get exerciseDate => dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get createdAt => text().nullable().clientDefault(() {
    DateTime now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}";
  })();
}
