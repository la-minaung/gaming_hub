import 'package:gaming_hub/data/vos/trailer_resolution_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trailer_vo.g.dart';

@JsonSerializable()
class TrailerVO {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'preview')
  String? preview;

  @JsonKey(name: 'data')
  TrailerResolutionVO? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrailerVO && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  TrailerVO(this.id, this.name, this.preview, this.data);

  factory TrailerVO.fromJson(Map<String, dynamic> json) =>
      _$TrailerVOFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerVOToJson(this);
}
