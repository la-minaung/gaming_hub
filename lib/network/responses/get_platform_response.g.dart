// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_platform_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlatformResponse _$GetPlatformResponseFromJson(Map<String, dynamic> json) =>
    GetPlatformResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => PlatformVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlatformResponseToJson(
        GetPlatformResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
