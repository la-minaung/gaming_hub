// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreVOAdapter extends TypeAdapter<GenreVO> {
  @override
  final int typeId = 4;

  @override
  GenreVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreVO(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GenreVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gameCount)
      ..writeByte(3)
      ..write(obj.imageBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreVO _$GenreVOFromJson(Map<String, dynamic> json) => GenreVO(
      json['id'] as int,
      json['name'] as String?,
      json['game_count'] as int?,
      json['image_background'] as String?,
    );

Map<String, dynamic> _$GenreVOToJson(GenreVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'game_count': instance.gameCount,
      'image_background': instance.imageBackground,
    };
