import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';
import 'package:gaming_hub/network/api_constants.dart';
import 'package:gaming_hub/network/dataagents/game_data_agent.dart';
import 'package:gaming_hub/network/dataagents/game_data_agent_impl.dart';
import 'package:gaming_hub/persistence/daos/game_dao.dart';
import 'package:gaming_hub/persistence/daos/genre_dao.dart';
import 'package:gaming_hub/persistence/daos/impls/game_dao_impl.dart';
import 'package:gaming_hub/persistence/daos/impls/genre_dao_impl.dart';
import 'package:gaming_hub/persistence/daos/impls/platform_dao_impl.dart';
import 'package:gaming_hub/persistence/daos/platform_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class GameModelImpl extends GameModel {
  GameDataAgent mDataAgent = GameDataAgentImpl();
  static final GameModelImpl _singleton = GameModelImpl._internal();

  GameModelImpl._internal();

  factory GameModelImpl() {
    return _singleton;
  }

  GameDao mGameDao = GameDaoImpl();
  GenreDao mGenreDao = GenreDaoImpl();
  PlatformDao mPlatformDao = PlatformDaoImpl();

  /// for testing
  void setDaosAndDataAgents(GameDataAgent gameDataAgent, GenreDao genreDaoImpl,
      GameDao gameDaoImpl, PlatformDao platformDaoImpl) {
    mDataAgent = gameDataAgent;
    mGenreDao = genreDaoImpl;
    mGameDao = gameDaoImpl;
    mPlatformDao = platformDaoImpl;
  }

  /// network

  @override
  void getBannerGameList() {
    this.getGames()?.then((games) async {
      List<GameVO>? bannerGames = games?.map((game) {
        game.isBanner = true;
        return game;
      }).toList();
      mGameDao.saveGames(bannerGames ?? []);
    });
  }

  @override
  void getLastWeekGameList(String dates) {
    this.getGames(ADDED, dates)?.then((games) async {
      List<GameVO>? lastWeekGames = games?.map((game) {
        game.isLastWeek = true;
        return game;
      }).toList();
      mGameDao.saveGames(lastWeekGames ?? []);
    });
  }

  @override
  void getLastYearGameList(String dates) {
    this.getGames(ADDED, dates)?.then((games) async {
      List<GameVO>? lastYearGames = games?.map((game) {
        game.isLastYear = true;
        return game;
      }).toList();
      mGameDao.saveGames(lastYearGames ?? []);
    });
  }

  @override
  void getComingSoonGameList(String dates) {
    this.getGames(ADDED, dates)?.then((games) async {
      List<GameVO>? comingSoonGames = games?.map((game) {
        game.isComingSoon = true;
        return game;
      }).toList();
      mGameDao.saveGames(comingSoonGames ?? []);
    });
  }

  @override
  void getGenres() {
    mDataAgent.getGenres()?.then((genres) async {
      mGenreDao.saveGenres(genres?.take(8).toList() ?? []);
    });
  }

  @override
  void getPlatforms() {
    mDataAgent.getPlatforms()?.then((platforms) async {
      mPlatformDao.savePlatforms(platforms?.take(8).toList() ?? []);
    });
  }

  @override
  Future<List<StoreVO>?>? getStores() {
    return mDataAgent.getStores();
  }

  @override
  Future<GameVO?>? getGameDetail(int gameId) {
    return mDataAgent.getGameDetail(gameId);
  }

  @override
  Future<List<GameVO>?>? getRelatedGames(int gameId, int page) {
    return mDataAgent.getRelatedGames(gameId, page);
  }

  @override
  Future<List<TrailerVO>?>? getGameTrailers(int gameId) {
    return mDataAgent.getGameTrailers(gameId);
  }

  @override
  Future<List<ScreenshotVO>?>? getGameScreenshots(int gameId) {
    return mDataAgent.getGameScreenshots(gameId);
  }

  @override
  Future<List<GameVO>?>? getGames(
      [String order = "",
      String dates = "",
      String search = "",
      int page = 1,
      bool searchExact = false]) {
    return mDataAgent.getGames(search, page, searchExact, order, dates);
  }

  @override
  Future<List<GameVO>?>? getGamesByGenre(
      String genreId, String search, int page, bool searchExact, String order) {
    return mDataAgent.getGamesByGenre(
        search, genreId, page, searchExact, order);
  }

  @override
  Future<List<GameVO>?>? getGamesByPlatform(String platformId, String search,
      int page, bool searchExact, String order) {
    return mDataAgent.getGamesByPlatform(
        search, platformId, page, searchExact, order);
  }

  @override
  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
      String genreId,
      String platformId,
      String search,
      int page,
      bool searchExact,
      String order) {
    return mDataAgent.getGamesByGenreAndPlatform(
        search, genreId, platformId, page, searchExact, order);
  }

  @override
  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page) {
    return mDataAgent.getGamesByPublisher(publisherId, page);
  }

  @override
  Future<List<GameStoreVO>?>? getGameStores(int gameId) async {
    var storeList = await this.getStores();
    return mDataAgent.getGameStores(gameId)?.then((gameStores) {
      if (storeList != null && storeList.length > 0) {
        gameStores?.map((gameStore) {
          /// check same store id
          gameStore.storeName = storeList
                  .firstWhere((store) => store.id == gameStore.storeId)
                  .name ??
              "";
          return gameStore;
        }).toList();
      }
      return gameStores;
    });
  }

  /// Database

  @override
  Stream<List<GameVO>> getBannerGamesFromDatabase() {
    this.getBannerGameList();
    return mGameDao
        .getAllGamesEventStream()
        .startWith(mGameDao.getBannerGamesStream())
        .map((event) => mGameDao.getBannerGames());
  }

  @override
  Stream<List<GameVO>> getLastWeekGamesFromDatabase(String dates) {
    this.getLastWeekGameList(dates);
    return mGameDao
        .getAllGamesEventStream()
        .startWith(mGameDao.getLastWeekGamesStream())
        .map((event) => mGameDao.getLastWeekGames());
  }

  @override
  Stream<List<GameVO>> getLastYearGamesFromDatabase(String dates) {
    this.getLastYearGameList(dates);
    return mGameDao
        .getAllGamesEventStream()
        .startWith(mGameDao.getLastYearGamesStream())
        .map((event) => mGameDao.getLastYearGames());
  }

  @override
  Stream<List<GameVO>> getComingSoonGamesFromDatabase(String dates) {
    this.getComingSoonGameList(dates);
    return mGameDao
        .getAllGamesEventStream()
        .startWith(mGameDao.getComingSoonGamesStream())
        .map((event) => mGameDao.getComingSoonGames());
  }

  @override
  Stream<List<GenreVO>> getGenresFromDatabase() {
    this.getGenres();
    return mGenreDao
        .getGenreEventStream()
        .startWith(mGenreDao.getGenreStream())
        .map((event) => mGenreDao.getGenres());
  }

  @override
  Stream<List<PlatformVO>> getPlatformsFromDatabase() {
    this.getPlatforms();
    return mPlatformDao
        .getPlatformEventStream()
        .startWith(mPlatformDao.getPlatformStream())
        .map((event) => mPlatformDao.getPlatforms());
  }
}
