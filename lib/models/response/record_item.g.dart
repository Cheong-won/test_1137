// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordItem _$RecordItemFromJson(Map<String, dynamic> json) => RecordItem(
      json['date'] as int,
      json['desc'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$RecordItemToJson(RecordItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'desc': instance.desc,
      'id': instance.id,
    };
