// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_game_trailer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGameTrailerResponse _$GetGameTrailerResponseFromJson(
        Map<String, dynamic> json) =>
    GetGameTrailerResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => TrailerVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGameTrailerResponseToJson(
        GetGameTrailerResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
