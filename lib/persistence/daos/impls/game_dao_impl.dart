import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

import '../game_dao.dart';

class GameDaoImpl extends GameDao {
  static final GameDaoImpl _singleton = GameDaoImpl._internal();

  factory GameDaoImpl() {
    return _singleton;
  }

  GameDaoImpl._internal();

  @override
  void saveGames(List<GameVO> gameList) async {
    Map<int, GameVO> gameMap = Map.fromIterable(gameList,
        key: (game) => game.id, value: (game) => game);
    await getGameBox().putAll(gameMap);
  }

  @override
  List<GameVO> getAllGames() {
    return getGameBox().values.toList();
  }

  Box<GameVO> getGameBox() {
    return Hive.box<GameVO>(BOX_NAME_GAME_VO);
  }

  @override
  Stream<void> getAllGamesEventStream() {
    return getGameBox().watch();
  }

  @override
  Stream<List<GameVO>> getBannerGamesStream() {
    return Stream.value(
        getAllGames().where((game) => game.isBanner ?? false).toList());
  }

  @override
  List<GameVO> getBannerGames() {
    if ((getAllGames().isNotEmpty)) {
      return getAllGames().where((game) => game.isBanner ?? false).toList();
    } else {
      return [];
    }
  }

  @override
  Stream<List<GameVO>> getComingSoonGamesStream() {
    return Stream.value(
        getAllGames().where((game) => game.isComingSoon ?? false).toList());
  }

  @override
  List<GameVO> getComingSoonGames() {
    if ((getAllGames().isNotEmpty)) {
      return getAllGames().where((game) => game.isComingSoon ?? false).toList();
    } else {
      return [];
    }
  }

  @override
  Stream<List<GameVO>> getLastYearGamesStream() {
    return Stream.value(
        getAllGames().where((game) => game.isLastYear ?? false).toList());
  }

  @override
  List<GameVO> getLastYearGames() {
    if ((getAllGames().isNotEmpty)) {
      return getAllGames().where((game) => game.isLastYear ?? false).toList();
    } else {
      return [];
    }
  }

  @override
  Stream<List<GameVO>> getLastWeekGamesStream() {
    return Stream.value(
        getAllGames().where((game) => game.isLastWeek ?? false).toList());
  }

  @override
  List<GameVO> getLastWeekGames() {
    if ((getAllGames().isNotEmpty)) {
      return getAllGames().where((game) => game.isLastWeek ?? false).toList();
    } else {
      return [];
    }
  }
}
