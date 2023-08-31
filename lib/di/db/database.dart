// These imports are only needed to open the database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fittrix/di/db/table.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@Singleton()
@DriftDatabase(tables: [Records])
class FittrixDatabase extends _$FittrixDatabase {
  // we tell the database where to store the data with this constructor
  FittrixDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {

      },
    );
  }
  Future<int> addItem(Insertable<Record> record){
    return into(records).insert(record);
  }

  //loads
  Future<List<Record>> get allRecordEntries => select(records).get();

  Future delTodo(data) {
    return delete(records).delete(data);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fittrix_db.sqlite'));
    return NativeDatabase(file);
  });
}
