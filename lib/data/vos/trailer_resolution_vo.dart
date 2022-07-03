import 'package:json_annotation/json_annotation.dart';

part 'trailer_resolution_vo.g.dart';

@JsonSerializable()
class TrailerResolutionVO {
  @JsonKey(name: '480')
  String? s480;

  @JsonKey(name: 'max')
  String? max;

  TrailerResolutionVO(this.s480, this.max);

  factory TrailerResolutionVO.fromJson(Map<String, dynamic> json) =>
      _$TrailerResolutionVOFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerResolutionVOToJson(this);
}
