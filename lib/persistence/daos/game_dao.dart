import 'package:gaming_hub/data/vos/game_vo.dart';

abstract class GameDao {
  void saveGames(List<GameVO> gameList);

  List<GameVO> getAllGames();

  Stream<void> getAllGamesEventStream();

  Stream<List<GameVO>> getBannerGamesStream();

  List<GameVO> getBannerGames();

  Stream<List<GameVO>> getComingSoonGamesStream();

  List<GameVO> getComingSoonGames();

  Stream<List<GameVO>> getLastYearGamesStream();

  List<GameVO> getLastYearGames();

  Stream<List<GameVO>> getLastWeekGamesStream();

  List<GameVO> getLastWeekGames();
}
