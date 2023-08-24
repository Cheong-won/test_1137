import 'package:json_annotation/json_annotation.dart';

part 'common_res.g.dart';

@JsonSerializable()
class CommonRes {
  @JsonKey(name: 'result')
  bool result;
  @JsonKey(name: 'result_code')
  int resultCode;
  @JsonKey(name: 'result_message')
  String resultMessage;


  CommonRes(this.result, this.resultCode, this.resultMessage);

  factory CommonRes.fromJson(Map<String, dynamic> json) =>
      _$CommonResFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResToJson(this);
}