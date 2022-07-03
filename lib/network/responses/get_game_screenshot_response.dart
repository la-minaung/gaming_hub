import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_game_screenshot_response.g.dart';

@JsonSerializable()
class GetGameScreenshotResponse {
  @JsonKey(name: 'results')
  List<ScreenshotVO>? results;

  GetGameScreenshotResponse(this.results);

  factory GetGameScreenshotResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGameScreenshotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGameScreenshotResponseToJson(this);
}
