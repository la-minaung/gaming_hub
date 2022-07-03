// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingVOAdapter extends TypeAdapter<RatingVO> {
  @override
  final int typeId = 6;

  @override
  RatingVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RatingVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingVO _$RatingVOFromJson(Map<String, dynamic> json) => RatingVO(
      json['id'] as int?,
      json['title'] as String?,
      json['count'] as int?,
      (json['percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingVOToJson(RatingVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };
