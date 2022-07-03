import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';

abstract class GameModel {
  /// network

  void getBannerGameList();

  void getComingSoonGameList(String dates);

  void getLastYearGameList(String dates);

  void getLastWeekGameList(String dates);

  void getGenres();

  void getPlatforms();

  Future<List<StoreVO>?>? getStores();

  Future<GameVO?>? getGameDetail(int gameId);

  Future<List<ScreenshotVO>?>? getGameScreenshots(int gameId);

  Future<List<GameVO>?>? getRelatedGames(int gameId, int page);

  Future<List<TrailerVO>?>? getGameTrailers(int gameId);

  Future<List<GameStoreVO>?>? getGameStores(int gameId);

  Future<List<GameVO>?>? getGames(
      String order, String dates, String search, int page, bool searchExact);

  Future<List<GameVO>?>? getGamesByGenre(
      String genreId, String search, int page, bool searchExact, String order);

  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page);

  Future<List<GameVO>?>? getGamesByPlatform(String platformId, String search,
      int page, bool searchExact, String order);

  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
    String genreId,
    String platformId,
    String search,
    int page,
    bool searchExact,
    String order,
  );

  /// database
  Stream<List<GameVO>> getBannerGamesFromDatabase();

  Stream<List<GenreVO>> getGenresFromDatabase();

  Stream<List<PlatformVO>> getPlatformsFromDatabase();

  Stream<List<GameVO>> getComingSoonGamesFromDatabase(String dates);

  Stream<List<GameVO>> getLastYearGamesFromDatabase(String dates);

  Stream<List<GameVO>> getLastWeekGamesFromDatabase(String dates);
}
