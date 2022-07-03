import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_genre_response.g.dart';

@JsonSerializable()
class GetGenreResponse {
  @JsonKey(name: 'results')
  List<GenreVO>? results;

  GetGenreResponse(this.results);

  factory GetGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGenreResponseToJson(this);
}
