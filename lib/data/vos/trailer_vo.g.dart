// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerVO _$TrailerVOFromJson(Map<String, dynamic> json) => TrailerVO(
      json['id'] as int,
      json['name'] as String?,
      json['preview'] as String?,
      json['data'] == null
          ? null
          : TrailerResolutionVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrailerVOToJson(TrailerVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preview': instance.preview,
      'data': instance.data,
    };
