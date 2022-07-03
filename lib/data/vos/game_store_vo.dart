import 'package:json_annotation/json_annotation.dart';

part 'game_store_vo.g.dart';

@JsonSerializable()
class GameStoreVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'game_id')
  int? gameId;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'url')
  String? url;

  String storeName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameStoreVO &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  GameStoreVO(this.id, this.gameId, this.storeId, this.url,
      {this.storeName = ""});

  factory GameStoreVO.fromJson(Map<String, dynamic> json) =>
      _$GameStoreVOFromJson(json);

  Map<String, dynamic> toJson() => _$GameStoreVOToJson(this);
}
