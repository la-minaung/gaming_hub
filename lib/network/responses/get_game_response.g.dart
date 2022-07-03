// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_game_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGameResponse _$GetGameResponseFromJson(Map<String, dynamic> json) =>
    GetGameResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => GameVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGameResponseToJson(GetGameResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
