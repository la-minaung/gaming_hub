import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';

import '../../mock_data/mock_data.dart';

class GameModelImplMock extends GameModel {
  @override
  void getBannerGameList() {}

  @override
  Stream<List<GameVO>> getBannerGamesFromDatabase() {
    return Stream.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGames(
      String order, String dates, String search, int page, bool searchExact) {
    return Future.value(getMockGames());
  }

  @override
  Future<GameVO?>? getGameDetail(int gameId) {
    return Future.value(getMockGames().first);
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
  Future<List<TrailerVO>?>? getGameTrailers(int gameId) {
    return Future.value(getMockTrailers());
  }

  @override
  Future<List<GameVO>?>? getGamesByGenre(
      String genreId, String search, int page, bool searchExact, String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
      String genreId,
      String platformId,
      String search,
      int page,
      bool searchExact,
      String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByPlatform(String platformId, String search,
      int page, bool searchExact, String order) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    return Future.value(getMockGenres());
  }

  @override
  Stream<List<GenreVO>> getGenresFromDatabase() {
    return Stream.value(getMockGenres());
  }

  @override
  Future<List<PlatformVO>?>? getPlatforms() {
    return Future.value(getMockPlatforms());
  }

  @override
  Stream<List<PlatformVO>> getPlatformsFromDatabase() {
    return Stream.value(getMockPlatforms());
  }

  @override
  Future<List<GameVO>?>? getRelatedGames(int gameId, int page) {
    return Future.value(getMockGames());
  }

  @override
  Future<List<StoreVO>?>? getStores() {
    return Future.value(getMockStores());
  }

  @override
  void getComingSoonGameList(String dates) {}

  @override
  Stream<List<GameVO>> getComingSoonGamesFromDatabase(String dates) {
    return Stream.value(getMockGames());
  }

  @override
  void getLastWeekGameList(String dates) {}

  @override
  Stream<List<GameVO>> getLastWeekGamesFromDatabase(String dates) {
    return Stream.value(getMockGames());
  }

  @override
  void getLastYearGameList(String dates) {}

  @override
  Stream<List<GameVO>> getLastYearGamesFromDatabase(String dates) {
    return Stream.value(getMockGames());
  }
}
