import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publisher_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_PUBLISHER_VO, adapterName: "PublisherVOAdapter")
class PublisherVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'games_count')
  @HiveField(2)
  int? gamesCount;

  @JsonKey(name: 'image_background')
  @HiveField(3)
  String? imageBackground;

  PublisherVO(this.id, this.name, this.gamesCount, this.imageBackground);

  factory PublisherVO.fromJson(Map<String, dynamic> json) =>
      _$PublisherVOFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherVOToJson(this);
}
