import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/persistence/daos/game_dao.dart';

import '../mock_data/mock_data.dart';

class GameDaoImplMock extends GameDao {
  Map<int, GameVO> gamesInDatabaseMock = {};

  @override
  List<GameVO> getLastWeekGames() {
    return getMockGames();
  }

  @override
  Stream<List<GameVO>> getLastWeekGamesStream() {
    return Stream.value(
        getMockGames().where((game) => game.isLastWeek ?? false).toList());
  }

  @override
  List<GameVO> getAllGames() {
    return getMockGames();
  }

  @override
  Stream<void> getAllGamesEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<GameVO> getBannerGames() {
    if (getMockGames().isNotEmpty) {
      return getMockGames().where((game) => game.isBanner ?? false).toList();
    } else {
      return [];
    }
  }

  @override
  Stream<List<GameVO>> getBannerGamesStream() {
    return Stream.value(
        getMockGames().where((game) => game.isBanner ?? false).toList());
  }

  @override
  List<GameVO> getLastYearGames() {
    return getMockGames();
  }

  @override
  Stream<List<GameVO>> getLastYearGamesStream() {
    return Stream.value(
        getMockGames().where((game) => game.isLastYear ?? false).toList());
  }

  @override
  List<GameVO> getComingSoonGames() {
    return getMockGames();
  }

  @override
  Stream<List<GameVO>> getComingSoonGamesStream() {
    return Stream.value(
        getMockGames().where((game) => game.isComingSoon ?? false).toList());
  }

  @override
  void saveGames(List<GameVO> gameList) {
    gameList.forEach((game) {
      gamesInDatabaseMock[game.id] = game;
    });
  }
}
