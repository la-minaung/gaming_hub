import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_platform_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_GAME_PLATFORM_VO, adapterName: "GamePlatformVOAdapter")
class GamePlatformVO {
  @JsonKey(name: 'platform')
  @HiveField(0)
  PlatformVO? platform;

  @JsonKey(name: 'released_at')
  @HiveField(1)
  String? releasedAt;

  @override
  String toString() {
    return 'GamePlatformVO{platform: $platform, releasedAt: $releasedAt}';
  }

  GamePlatformVO(this.platform, this.releasedAt);

  factory GamePlatformVO.fromJson(Map<String, dynamic> json) =>
      _$GamePlatformVOFromJson(json);

  Map<String, dynamic> toJson() => _$GamePlatformVOToJson(this);
}
