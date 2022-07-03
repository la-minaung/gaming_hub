import 'package:gaming_hub/data/vos/genre_vo.dart';

abstract class GenreDao {
  Stream<void> getGenreEventStream();
  void saveGenres(List<GenreVO> genreList);
  List<GenreVO> getGenres();
  Stream<List<GenreVO>> getGenreStream();
}
