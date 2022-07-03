import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_STORE_VO, adapterName: "StoreVOAdapter")
class StoreVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'domain')
  @HiveField(2)
  String? domain;

  @JsonKey(name: 'games_count')
  @HiveField(3)
  int? gamesCount;

  @JsonKey(name: 'image_background')
  @HiveField(4)
  String? imageBackground;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  StoreVO(
      this.id, this.name, this.domain, this.gamesCount, this.imageBackground);

  factory StoreVO.fromJson(Map<String, dynamic> json) =>
      _$StoreVOFromJson(json);

  Map<String, dynamic> toJson() => _$StoreVOToJson(this);
}
