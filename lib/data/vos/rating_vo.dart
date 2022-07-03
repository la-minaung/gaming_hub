import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_RATING_VO, adapterName: "RatingVOAdapter")
class RatingVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;

  @JsonKey(name: 'count')
  @HiveField(2)
  int? count;

  @JsonKey(name: 'percent')
  @HiveField(3)
  double? percent;

  RatingVO(this.id, this.title, this.count, this.percent);

  factory RatingVO.fromJson(Map<String, dynamic> json) =>
      _$RatingVOFromJson(json);

  Map<String, dynamic> toJson() => _$RatingVOToJson(this);
}
