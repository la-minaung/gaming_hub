// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_game_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGameStoreResponse _$GetGameStoreResponseFromJson(
        Map<String, dynamic> json) =>
    GetGameStoreResponse(
      json['count'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => GameStoreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGameStoreResponseToJson(
        GetGameStoreResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };
