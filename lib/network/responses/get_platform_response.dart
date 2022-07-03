import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_platform_response.g.dart';

@JsonSerializable()
class GetPlatformResponse {
  @JsonKey(name: 'results')
  List<PlatformVO>? results;

  GetPlatformResponse(this.results);

  factory GetPlatformResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlatformResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlatformResponseToJson(this);
}
