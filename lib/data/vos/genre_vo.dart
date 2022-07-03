import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_GENRE_VO, adapterName: "GenreVOAdapter")
class GenreVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'game_count')
  @HiveField(2)
  int? gameCount;

  @JsonKey(name: 'image_background')
  @HiveField(3)
  String? imageBackground;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  GenreVO(this.id, this.name, this.gameCount, this.imageBackground);

  factory GenreVO.fromJson(Map<String, dynamic> json) =>
      _$GenreVOFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}
