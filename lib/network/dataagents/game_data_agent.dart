import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';

abstract class GameDataAgent {
  Future<GameVO>? getGameDetail(int gameId);

  Future<List<GenreVO>?>? getGenres();

  Future<List<PlatformVO>?>? getPlatforms();

  Future<List<ScreenshotVO>?>? getGameScreenshots(int gameId);

  Future<List<StoreVO>?>? getStores();

  Future<List<GameVO>?>? getRelatedGames(int gameId, int page);

  Future<List<TrailerVO>?>? getGameTrailers(int gameId);

  Future<List<GameVO>?>? getGames(
      String search, int page, bool searchExact, String order, String dates);

  Future<List<GameVO>?>? getGamesByGenre(String gameName, String genreId,
      int page, bool searchExact, String order);

  Future<List<GameVO>?>? getGamesByPlatform(String gameName, String platformId,
      int page, bool searchExact, String order);

  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page);

  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
      String gameName,
      String genreId,
      String platformId,
      int page,
      bool searchExact,
      String order);

  Future<List<GameStoreVO>?>? getGameStores(int gameId);
}
