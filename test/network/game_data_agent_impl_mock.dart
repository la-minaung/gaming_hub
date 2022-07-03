import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';
import 'package:gaming_hub/network/dataagents/game_data_agent.dart';

import '../mock_data/mock_data.dart';

class GameDataAgentImplMock extends GameDataAgent {
  @override
  Future<GameVO>? getGameDetail(int gameId) {
    return Future.value(getMockGames().first);
  }

  @override
  Future<List<TrailerVO>?>? getGameTrailers(int gameId) {
    return Future.value(getMockTrailers());
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    return Future.value(getMockGenres());
  }

  @override
  Future<List<ScreenshotVO>?>? getGameScreenshots(int gameId) {
    return Future.value(getMockScreenshots());
  }

  @override
  Future<List<GameStoreVO>?>? getGameStores(int gameId) {
    return Future.value(getMockGameStore());
  }

  @override
  Future<List<GameVO>?>? getGames(
      String gameName, int page, bool searchExact, String order, String dates) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
      String gameName,
      String genreId,
      String platformId,
      int page,
      bool searchExact,
      String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByGenre(String gameName, String genreId,
      int page, bool searchExact, String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByPlatform(String gameName, String platformId,
      int page, bool searchExact, String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<PlatformVO>?>? getPlatforms() {
    return Future.value(getMockPlatforms());
  }

  @override
  Future<List<GameVO>?>? getRelatedGames(int gameId, int page) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<StoreVO>?>? getStores() {
    return Future.value(getMockStores());
  }
}
