// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_platform_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GamePlatformVOAdapter extends TypeAdapter<GamePlatformVO> {
  @override
  final int typeId = 1;

  @override
  GamePlatformVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GamePlatformVO(
      fields[0] as PlatformVO?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GamePlatformVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.platform)
      ..writeByte(1)
      ..write(obj.releasedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GamePlatformVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePlatformVO _$GamePlatformVOFromJson(Map<String, dynamic> json) =>
    GamePlatformVO(
      json['platform'] == null
          ? null
          : PlatformVO.fromJson(json['platform'] as Map<String, dynamic>),
      json['released_at'] as String?,
    );

Map<String, dynamic> _$GamePlatformVOToJson(GamePlatformVO instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'released_at': instance.releasedAt,
    };
