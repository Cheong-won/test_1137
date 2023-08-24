// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonRes _$CommonResFromJson(Map<String, dynamic> json) => CommonRes(
      json['result'] as bool,
      json['result_code'] as int,
      json['result_message'] as String,
    );

Map<String, dynamic> _$CommonResToJson(CommonRes instance) => <String, dynamic>{
      'result': instance.result,
      'result_code': instance.resultCode,
      'result_message': instance.resultMessage,
    };
