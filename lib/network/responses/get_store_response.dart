import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_store_response.g.dart';

@JsonSerializable()
class GetStoreResponse {
  @JsonKey(name: 'results')
  List<StoreVO>? results;

  GetStoreResponse(this.results);

  factory GetStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreResponseToJson(this);
}
