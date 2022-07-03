// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameVOAdapter extends TypeAdapter<GameVO> {
  @override
  final int typeId = 2;

  @override
  GameVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameVO(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as double?,
      fields[6] as int?,
      fields[7] as int?,
      (fields[8] as List?)?.cast<RatingVO>(),
      (fields[9] as List?)?.cast<GamePlatformVO>(),
      (fields[10] as List?)?.cast<GamePlatformVO>(),
      (fields[11] as List?)?.cast<PublisherVO>(),
      (fields[12] as List?)?.cast<ScreenshotVO>(),
      isBanner: fields[13] as bool?,
      isLastYear: fields[14] as bool?,
      isComingSoon: fields[15] as bool?,
      isLastWeek: fields[16] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, GameVO obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.backgroundImage)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.released)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.ratingCount)
      ..writeByte(7)
      ..write(obj.reviewsTextCount)
      ..writeByte(8)
      ..write(obj.ratings)
      ..writeByte(9)
      ..write(obj.platforms)
      ..writeByte(10)
      ..write(obj.parentPlatforms)
      ..writeByte(11)
      ..write(obj.publishers)
      ..writeByte(12)
      ..write(obj.shortScreenShots)
      ..writeByte(13)
      ..write(obj.isBanner)
      ..writeByte(14)
      ..write(obj.isLastYear)
      ..writeByte(15)
      ..write(obj.isComingSoon)
      ..writeByte(16)
      ..write(obj.isLastWeek);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVO _$GameVOFromJson(Map<String, dynamic> json) => GameVO(
      json['id'] as int,
      json['name'] as String?,
      json['background_image'] as String?,
      json['description_raw'] as String?,
      json['released'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['ratings_count'] as int?,
      json['reviews_text_count'] as int?,
      (json['ratings'] as List<dynamic>?)
          ?.map((e) => RatingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['platforms'] as List<dynamic>?)
          ?.map((e) => GamePlatformVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['parent_platforms'] as List<dynamic>?)
          ?.map((e) => GamePlatformVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['publishers'] as List<dynamic>?)
          ?.map((e) => PublisherVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['short_screenshots'] as List<dynamic>?)
          ?.map((e) => ScreenshotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBanner: json['isBanner'] as bool? ?? false,
      isLastYear: json['isLastYear'] as bool? ?? false,
      isComingSoon: json['isUpcoming'] as bool? ?? false,
      isLastWeek: json['isLastThirty'] as bool? ?? false,
    );

Map<String, dynamic> _$GameVOToJson(GameVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'description_raw': instance.description,
      'released': instance.released,
      'rating': instance.rating,
      'ratings_count': instance.ratingCount,
      'reviews_text_count': instance.reviewsTextCount,
      'ratings': instance.ratings,
      'platforms': instance.platforms,
      'parent_platforms': instance.parentPlatforms,
      'publishers': instance.publishers,
      'short_screenshots': instance.shortScreenShots,
      'isBanner': instance.isBanner,
      'isLastYear': instance.isLastYear,
      'isUpcoming': instance.isComingSoon,
      'isLastThirty': instance.isLastWeek,
    };
