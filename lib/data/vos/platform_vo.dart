import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'platform_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_PLATFORM_VO, adapterName: "PlatformVOAdapter")
class PlatformVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'slug')
  @HiveField(2)
  String? slug;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  PlatformVO(this.id, this.name, this.slug);

  factory PlatformVO.fromJson(Map<String, dynamic> json) =>
      _$PlatformVOFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformVOToJson(this);
}
