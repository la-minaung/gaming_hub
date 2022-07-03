import 'package:dio/dio.dart';
import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';
import 'package:gaming_hub/network/api_constants.dart';
import 'package:gaming_hub/network/dataagents/game_data_agent.dart';
import 'package:gaming_hub/network/the_game_api.dart';

class GameDataAgentImpl extends GameDataAgent {
  TheGameApi? mApi;

  static final GameDataAgentImpl _singleton = GameDataAgentImpl._internal();

  factory GameDataAgentImpl() {
    return _singleton;
  }

  GameDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheGameApi(dio);
  }

  @override
  Future<GameVO>? getGameDetail(int gameId) {
    return mApi
        ?.getGameDetail(API_KEY, gameId.toString())
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    return mApi
        ?.getGenres(API_KEY)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<PlatformVO>?>? getPlatforms() {
    return mApi
        ?.getPlatforms(API_KEY)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<StoreVO>?>? getStores() {
    return mApi
        ?.getStores(API_KEY)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<ScreenshotVO>?>? getGameScreenshots(int gameId) {
    return mApi
        ?.getGameScreenShots(API_KEY, gameId.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getRelatedGames(int gameId, int page) {
    return mApi
        ?.getRelatedGames(API_KEY, gameId.toString(), page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<TrailerVO>?>? getGameTrailers(int gameId) {
    return mApi
        ?.getGameTrailers(API_KEY, gameId.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getGames(
      String search, int page, bool searchExact, String order, String dates) {
    return mApi
        ?.getGames(API_KEY, search, page.toString(), searchExact.toString(),
            order, dates)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getGamesByGenre(String gameName, String genreId,
      int page, bool searchExact, String order) {
    return mApi
        ?.getGamesByGenre(
            API_KEY, gameName, genreId, searchExact.toString(), order)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getGamesByPlatform(String gameName, String platformId,
      int page, bool searchExact, String order) {
    return mApi
        ?.getGamesByPlatform(API_KEY, gameName, platformId, page.toString(),
            searchExact.toString(), order)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getGamesByGenreAndPlatform(
      String gameName,
      String genreId,
      String platformId,
      int page,
      bool searchExact,
      String order) {
    return mApi
        ?.getGamesByGenreAndPlatform(API_KEY, gameName, genreId, platformId,
            page.toString(), searchExact.toString(), order)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameVO>?>? getGamesByPublisher(int publisherId, int page) {
    return mApi
        ?.getGamesByPublisher(
            API_KEY, publisherId.toString(), page.toString(), "")
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GameStoreVO>?>? getGameStores(int gameId) {
    return mApi
        ?.getGameStores(API_KEY, gameId.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }
}
