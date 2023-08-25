import 'package:json_annotation/json_annotation.dart';

part 'record_item.g.dart';

@JsonSerializable()
class RecordItem {
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'desc')
  String desc;
  @JsonKey(name: 'id')
  String id;


  RecordItem(this.date, this.desc, this.id);

  factory RecordItem.fromJson(Map<String, dynamic> json) =>
      _$RecordItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecordItemToJson(this);
}