import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screenshot_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_SCREENSHOT_VO, adapterName: "ScreenshotVOAdapter")
class ScreenshotVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'image')
  @HiveField(1)
  String image;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenshotVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image;

  @override
  int get hashCode => id.hashCode ^ image.hashCode;

  ScreenshotVO(this.id, this.image);

  factory ScreenshotVO.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotVOFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotVOToJson(this);
}
