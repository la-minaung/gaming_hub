import 'package:gaming_hub/data/vos/game_platform_vo.dart';
import 'package:gaming_hub/data/vos/publisher_vo.dart';
import 'package:gaming_hub/data/vos/rating_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_GAME_VO, adapterName: "GameVOAdapter")
class GameVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'background_image')
  @HiveField(2)
  String? backgroundImage;

  @JsonKey(name: 'description_raw')
  @HiveField(3)
  String? description;

  @JsonKey(name: 'released')
  @HiveField(4)
  String? released;

  @JsonKey(name: 'rating')
  @HiveField(5)
  double? rating;

  @JsonKey(name: 'ratings_count')
  @HiveField(6)
  int? ratingCount;

  @JsonKey(name: 'reviews_text_count')
  @HiveField(7)
  int? reviewsTextCount;

  @JsonKey(name: 'ratings')
  @HiveField(8)
  List<RatingVO>? ratings;

  @JsonKey(name: 'platforms')
  @HiveField(9)
  List<GamePlatformVO>? platforms;

  @HiveField(10)
  @JsonKey(name: 'parent_platforms')
  List<GamePlatformVO>? parentPlatforms;

  @HiveField(11)
  @JsonKey(name: 'publishers')
  List<PublisherVO>? publishers;

  @HiveField(12)
  @JsonKey(name: 'short_screenshots')
  List<ScreenshotVO>? shortScreenShots;

  @HiveField(13)
  bool? isBanner;

  @HiveField(14)
  bool? isLastYear;

  @HiveField(15)
  bool? isComingSoon;

  @HiveField(16)
  bool? isLastWeek;

  GameVO(
      this.id,
      this.name,
      this.backgroundImage,
      this.description,
      this.released,
      this.rating,
      this.ratingCount,
      this.reviewsTextCount,
      this.ratings,
      this.platforms,
      this.parentPlatforms,
      this.publishers,
      this.shortScreenShots,
      {this.isBanner = false,
      this.isLastYear = false,
      this.isComingSoon = false,
      this.isLastWeek = false}); // GameVO(
  //     this.id,
  //     this.name,
  //     this.backgroundImage,
  //     this.description,
  //     this.released,
  //     this.rating,
  //     this.ratingCount,
  //     this.ratings,
  //     this.platforms,
  //     this.parentPlatforms,
  //     this.publishers,
  //     this.shortScreenShots,
  //     {this.isBanner = false,
  //     this.isLastYear = false,
  //     this.isUpcoming = false,
  //     this.isLastThirty = false}
  // );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory GameVO.fromJson(Map<String, dynamic> json) => _$GameVOFromJson(json);

  Map<String, dynamic> toJson() => _$GameVOToJson(this);
}
