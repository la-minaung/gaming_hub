// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_publisher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPublisherResponse _$GetPublisherResponseFromJson(
        Map<String, dynamic> json) =>
    GetPublisherResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => PublisherVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPublisherResponseToJson(
        GetPublisherResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
