import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/persistence/daos/genre_dao.dart';

class GenreDaoImplMock extends GenreDao {
  Map<int, GenreVO> genreListFromDatabaseMock = {};

  @override
  List<GenreVO> getGenres() {
    return genreListFromDatabaseMock.values.toList();
  }

  @override
  void saveGenres(List<GenreVO> genreList) {
    genreList.forEach((genre) {
      genreListFromDatabaseMock[genre.id] = genre;
    });
  }

  @override
  Stream<List<GenreVO>> getGenreStream() {
    return Stream.value(genreListFromDatabaseMock.values.toList());
  }

  @override
  Stream<void> getGenreEventStream() {
    return Stream<void>.value(null);
  }
}
