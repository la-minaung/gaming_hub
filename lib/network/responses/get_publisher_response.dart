import 'package:gaming_hub/data/vos/publisher_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_publisher_response.g.dart';

@JsonSerializable()
class GetPublisherResponse {
  @JsonKey(name: 'results')
  List<PublisherVO>? results;

  GetPublisherResponse(this.results);

  factory GetPublisherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPublisherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPublisherResponseToJson(this);
}
