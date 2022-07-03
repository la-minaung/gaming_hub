// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenreResponse _$GetGenreResponseFromJson(Map<String, dynamic> json) =>
    GetGenreResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGenreResponseToJson(GetGenreResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
