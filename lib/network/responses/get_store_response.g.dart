// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoreResponse _$GetStoreResponseFromJson(Map<String, dynamic> json) =>
    GetStoreResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => StoreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStoreResponseToJson(GetStoreResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
