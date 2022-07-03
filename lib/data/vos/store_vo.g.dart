// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreVOAdapter extends TypeAdapter<StoreVO> {
  @override
  final int typeId = 8;

  @override
  StoreVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreVO(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as int?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.gamesCount)
      ..writeByte(4)
      ..write(obj.imageBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreVO _$StoreVOFromJson(Map<String, dynamic> json) => StoreVO(
      json['id'] as int,
      json['name'] as String?,
      json['domain'] as String?,
      json['games_count'] as int?,
      json['image_background'] as String?,
    );

Map<String, dynamic> _$StoreVOToJson(StoreVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'domain': instance.domain,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };
