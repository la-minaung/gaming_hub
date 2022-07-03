import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/data/models/game_model_impl.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';

import '../../mock_data/mock_data.dart';
import '../../network/game_data_agent_impl_mock.dart';
import '../../persistence/game_dao_impl_mock.dart';
import '../../persistence/genre_dao_impl_mock.dart';
import '../../persistence/platform_dao_impl_mock.dart';

void main() {
  /// testing data layer or unit testing

  group("game_model_impl", () {
    var gameModel = GameModelImpl();

    /// run before every test run
    setUp(() {
      gameModel.setDaosAndDataAgents(GameDataAgentImplMock(),
          GenreDaoImplMock(), GameDaoImplMock(), PlatformDaoImplMock());
    });

    /// for stream
    test('Banner Game Test', () {
      expect(
        gameModel.getBannerGamesFromDatabase(),
        emits([
          GameVO(
              1,
              "GTA 5",
              "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
              "After a robbery goes badly wrong in the western town of Blackwater, Arthur Morgan and the Van der Linde gang are forced to flee.",
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              isBanner: true,
              isLastYear: false,
              isComingSoon: false,
              isLastWeek: false),
        ]),
      );
    });

    test('Game Store Test', () {
      expect(
        gameModel.getGameStores(1),
        completion(
          equals(getMockGameStore()),
        ),
      );
    });

    /// for future
    test('Store Test', () {
      expect(
        gameModel.getStores(),
        completion(
          equals(getMockStores()),
        ),
      );
    });

    test('Screenshot Test', () {
      expect(gameModel.getGameScreenshots(1),
          completion(equals(getMockScreenshots())));
    });

    /// this form works like reactive
    test('Genre Test', () async {
      // await gameModel.getGenres();
      expect(gameModel.getGenresFromDatabase(), emits(getMockGenres()));
    });

    test('Platform Test', () async {
      // await gameModel.getPlatforms();
      expect(gameModel.getPlatformsFromDatabase(), emits(getMockPlatforms()));
    });

    test('Trailer Test', () {
      expect(
          gameModel.getGameTrailers(1), completion(equals(getMockTrailers())));
    });
  });
}
