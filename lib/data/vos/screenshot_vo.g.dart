// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshot_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScreenshotVOAdapter extends TypeAdapter<ScreenshotVO> {
  @override
  final int typeId = 5;

  @override
  ScreenshotVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScreenshotVO(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScreenshotVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenshotVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenshotVO _$ScreenshotVOFromJson(Map<String, dynamic> json) => ScreenshotVO(
      json['id'] as int,
      json['image'] as String,
    );

Map<String, dynamic> _$ScreenshotVOToJson(ScreenshotVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
