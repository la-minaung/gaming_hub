// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_game_screenshot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGameScreenshotResponse _$GetGameScreenshotResponseFromJson(
        Map<String, dynamic> json) =>
    GetGameScreenshotResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ScreenshotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGameScreenshotResponseToJson(
        GetGameScreenshotResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
