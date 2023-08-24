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
@DriftDatabase(tables: [Todos, Categories])
class NiceWaterDatabase extends _$NiceWaterDatabase {
  // we tell the database where to store the data with this constructor
  NiceWaterDatabase() : super(_openConnection());

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
        if (from < 2) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          await m.addColumn(todos, todos.dueDate as GeneratedColumn<Object>);
        }
        if (from < 3) {
          // we added the priority property in the change from version 1 or 2
          // to version 3
          await m.addColumn(todos, todos.priority as GeneratedColumn<Object>);
        }
      },
    );
  }
  Future<int> addItem(TodosCompanion entry){
    return into(todos).insert(entry);
  }

  //loads
  Future<List<Todo>> get allTodoEntries => select(todos).get();

  Future delTodo(data) {
    return delete(todos).delete(data);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nice_water_db.sqlite'));
    return NativeDatabase(file);
  });
}
