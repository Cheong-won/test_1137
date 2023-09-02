// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseDateMeta =
      const VerificationMeta('exerciseDate');
  @override
  late final GeneratedColumn<DateTime> exerciseDate = GeneratedColumn<DateTime>(
      'exercise_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false, clientDefault: () {
    DateTime now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  });
  @override
  List<GeneratedColumn> get $columns => [id, desc, exerciseDate, createdAt];
  @override
  String get aliasedName => _alias ?? 'records';
  @override
  String get actualTableName => 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('exercise_date')) {
      context.handle(
          _exerciseDateMeta,
          exerciseDate.isAcceptableOrUnknown(
              data['exercise_date']!, _exerciseDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Record(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      exerciseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}exercise_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(attachedDatabase, alias);
  }
}

class Record extends DataClass implements Insertable<Record> {
  final int? id;
  final String desc;
  final DateTime exerciseDate;
  final String? createdAt;
  const Record(
      {this.id,
      required this.desc,
      required this.exerciseDate,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['desc'] = Variable<String>(desc);
    map['exercise_date'] = Variable<DateTime>(exerciseDate);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      desc: Value(desc),
      exerciseDate: Value(exerciseDate),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int?>(json['id']),
      desc: serializer.fromJson<String>(json['desc']),
      exerciseDate: serializer.fromJson<DateTime>(json['exerciseDate']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'desc': serializer.toJson<String>(desc),
      'exerciseDate': serializer.toJson<DateTime>(exerciseDate),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  Record copyWith(
          {Value<int?> id = const Value.absent(),
          String? desc,
          DateTime? exerciseDate,
          Value<String?> createdAt = const Value.absent()}) =>
      Record(
        id: id.present ? id.value : this.id,
        desc: desc ?? this.desc,
        exerciseDate: exerciseDate ?? this.exerciseDate,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('desc: $desc, ')
          ..write('exerciseDate: $exerciseDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, desc, exerciseDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.desc == this.desc &&
          other.exerciseDate == this.exerciseDate &&
          other.createdAt == this.createdAt);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int?> id;
  final Value<String> desc;
  final Value<DateTime> exerciseDate;
  final Value<String?> createdAt;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.desc = const Value.absent(),
    this.exerciseDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    required String desc,
    this.exerciseDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : desc = Value(desc);
  static Insertable<Record> custom({
    Expression<int>? id,
    Expression<String>? desc,
    Expression<DateTime>? exerciseDate,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (desc != null) 'desc': desc,
      if (exerciseDate != null) 'exercise_date': exerciseDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecordsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? desc,
      Value<DateTime>? exerciseDate,
      Value<String?>? createdAt}) {
    return RecordsCompanion(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      exerciseDate: exerciseDate ?? this.exerciseDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (exerciseDate.present) {
      map['exercise_date'] = Variable<DateTime>(exerciseDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('desc: $desc, ')
          ..write('exerciseDate: $exerciseDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$FittrixDatabase extends GeneratedDatabase {
  _$FittrixDatabase(QueryExecutor e) : super(e);
  late final $RecordsTable records = $RecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [records];
}
