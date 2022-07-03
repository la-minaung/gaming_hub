import 'package:dio/dio.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/network/api_constants.dart';
import 'package:gaming_hub/network/responses/get_game_response.dart';
import 'package:gaming_hub/network/responses/get_game_screenshot_response.dart';
import 'package:gaming_hub/network/responses/get_game_store_response.dart';
import 'package:gaming_hub/network/responses/get_game_trailer_response.dart';
import 'package:gaming_hub/network/responses/get_genre_response.dart';
import 'package:gaming_hub/network/responses/get_platform_response.dart';
import 'package:gaming_hub/network/responses/get_publisher_response.dart';
import 'package:gaming_hub/network/responses/get_store_response.dart';
import 'package:retrofit/http.dart';

part 'the_game_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheGameApi {
  factory TheGameApi(Dio dio) = _TheGameApi;

  @GET('$ENDPOINT_GET_GAME/{game_id}')
  Future<GameVO> getGameDetail(
    @Query(PARAM_API_KEY) String apiKey,
    @Path('game_id') String gameId,
  );

  @GET(ENDPOINT_GET_GENRES)
  Future<GetGenreResponse> getGenres(@Query(PARAM_API_KEY) String apiKey);

  @GET('$ENDPOINT_GET_GAME/{game_id}/screenshots')
  Future<GetGameScreenshotResponse> getGameScreenShots(
    @Query(PARAM_API_KEY) String apiKey,
    @Path('game_id') String gameId,
  );

  @GET(ENDPOINT_GET_PLATFORMS)
  Future<GetPlatformResponse> getPlatforms(
    @Query(PARAM_API_KEY) String apiKey,
  );

  @GET(ENDPOINT_GET_STORES)
  Future<GetStoreResponse> getStores(@Query(PARAM_API_KEY) String apiKey);

  @GET(ENDPOINT_GET_PUBLISHERS)
  Future<GetPublisherResponse> getPublishers(
    @Query(PARAM_API_KEY) String apiKey,
  );

  @GET('$ENDPOINT_GET_GAME/{game_id}/game-series')
  Future<GetGameResponse> getRelatedGames(
    @Query(PARAM_API_KEY) String apiKey,
    @Path('game_id') String gameId,
    @Query(PARAM_PAGE) String page,
  );

  @GET('$ENDPOINT_GET_GAME/{game_id}/movies')
  Future<GetGameTrailerResponse> getGameTrailers(
    @Query(PARAM_API_KEY) String apiKey,
    @Path('game_id') String gameId,
  );

  @GET(ENDPOINT_GET_GAME)
  Future<GetGameResponse> getGames(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_SEARCH) String gameName,
    @Query(PARAM_PAGE) String page,
    @Query(PARAM_SEARCH_EXACT) String searchExact,
    @Query(PARAM_ORDER) String order,
    @Query(PARAM_DATE) String dates,
  );

  @GET(ENDPOINT_GET_GAME)
  Future<GetGameResponse> getGamesByGenre(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_SEARCH) String gameName,
    @Query(PARAM_GENRE) String genreId,
    @Query(PARAM_SEARCH_EXACT) String searchExact,
    @Query(PARAM_ORDER) String order,
  );

  @GET(ENDPOINT_GET_GAME)
  Future<GetGameResponse> getGamesByPlatform(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_SEARCH) String gameName,
    @Query(PARAM_PLATFORM) String platformId,
    @Query(PARAM_PAGE) String page,
    @Query(PARAM_SEARCH_EXACT) String searchExact,
    @Query(PARAM_ORDER) String order,
  );

  @GET(ENDPOINT_GET_GAME)
  Future<GetGameResponse> getGamesByPublisher(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHER) String publisherId,
    @Query(PARAM_PAGE) String page,
    @Query(PARAM_ORDER) String order,
  );

  @GET(ENDPOINT_GET_GAME)
  Future<GetGameResponse> getGamesByGenreAndPlatform(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_SEARCH) String gameName,
    @Query(PARAM_GENRE) String genreId,
    @Query(PARAM_PLATFORM) String platformId,
    @Query(PARAM_PAGE) String page,
    @Query(PARAM_SEARCH_EXACT) String searchExact,
    @Query(PARAM_ORDER) String order,
  );

  @GET('$ENDPOINT_GET_GAME/{game_id}/stores')
  Future<GetGameStoreResponse> getGameStores(
    @Query(PARAM_API_KEY) String apiKey,
    @Path('game_id') String gameId,
  );
}
