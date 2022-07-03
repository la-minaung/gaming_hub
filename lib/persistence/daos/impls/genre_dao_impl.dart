import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/persistence/daos/genre_dao.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class GenreDaoImpl extends GenreDao {
  static final GenreDaoImpl _singleton = GenreDaoImpl._internal();

  factory GenreDaoImpl() {
    return _singleton;
  }

  GenreDaoImpl._internal();

  @override
  void saveGenres(List<GenreVO> genreList) async {
    Map<int, GenreVO> genreMap = Map.fromIterable(genreList,
        key: (genre) => genre.id, value: (genre) => genre);
    await getGenreBox().putAll(genreMap);
  }

  @override
  List<GenreVO> getGenres() {
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }

  @override
  Stream<List<GenreVO>> getGenreStream() {
    return Stream.value(getGenres());
  }

  @override
  Stream<void> getGenreEventStream() {
    return getGenreBox().watch();
  }
}
