import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_game_response.g.dart';

@JsonSerializable()
class GetGameResponse {
  @JsonKey(name: 'results')
  List<GameVO>? results;

  GetGameResponse(this.results);

  factory GetGameResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGameResponseToJson(this);
}
