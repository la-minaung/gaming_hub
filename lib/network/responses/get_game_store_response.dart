import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_game_store_response.g.dart';

@JsonSerializable()
class GetGameStoreResponse {
  @JsonKey(name: 'count')
  int? count;

  @JsonKey(name: 'results')
  List<GameStoreVO>? results;

  GetGameStoreResponse(this.count, this.results);

  factory GetGameStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGameStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGameStoreResponseToJson(this);
}
