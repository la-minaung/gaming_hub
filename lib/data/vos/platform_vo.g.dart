// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlatformVOAdapter extends TypeAdapter<PlatformVO> {
  @override
  final int typeId = 3;

  @override
  PlatformVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlatformVO(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlatformVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformVO _$PlatformVOFromJson(Map<String, dynamic> json) => PlatformVO(
      json['id'] as int,
      json['name'] as String?,
      json['slug'] as String?,
    );

Map<String, dynamic> _$PlatformVOToJson(PlatformVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
