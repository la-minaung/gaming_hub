// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStoreVO _$GameStoreVOFromJson(Map<String, dynamic> json) => GameStoreVO(
      json['id'] as int?,
      json['game_id'] as int?,
      json['store_id'] as int?,
      json['url'] as String?,
      storeName: json['storeName'] as String? ?? "",
    );

Map<String, dynamic> _$GameStoreVOToJson(GameStoreVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'store_id': instance.storeId,
      'url': instance.url,
      'storeName': instance.storeName,
    };
