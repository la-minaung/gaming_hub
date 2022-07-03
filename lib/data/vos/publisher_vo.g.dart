// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublisherVOAdapter extends TypeAdapter<PublisherVO> {
  @override
  final int typeId = 7;

  @override
  PublisherVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PublisherVO(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PublisherVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gamesCount)
      ..writeByte(3)
      ..write(obj.imageBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublisherVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherVO _$PublisherVOFromJson(Map<String, dynamic> json) => PublisherVO(
      json['id'] as int,
      json['name'] as String?,
      json['games_count'] as int?,
      json['image_background'] as String?,
    );

Map<String, dynamic> _$PublisherVOToJson(PublisherVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };
