import 'package:gaming_hub/data/vos/trailer_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_game_trailer_response.g.dart';

@JsonSerializable()
class GetGameTrailerResponse {
  @JsonKey(name: 'results')
  List<TrailerVO>? results;

  GetGameTrailerResponse(this.results);

  factory GetGameTrailerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGameTrailerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGameTrailerResponseToJson(this);
}
