import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/blocs/game_detail_bloc.dart';

import '../data/models/game_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('Game Detail Bloc Test', () {
    GameDetailBloc? gameDetailBloc;

    setUp(() {
      gameDetailBloc = GameDetailBloc(1, GameModelImplMock());
    });

    test('Game Detail Test', () {
      expect(gameDetailBloc?.mGameVO == getMockGames().first, true);
    });

    test('Game Screenshot Test', () {
      expect(
        gameDetailBloc?.mScreenshotList?.contains(getMockScreenshots().first),
        true,
      );
    });

    test('Game Trailer Test', () {
      expect(
        gameDetailBloc?.mGameTrailerList?.contains(getMockTrailers().first),
        true,
      );
    });

    test('Game Store Test', () {
      expect(
        gameDetailBloc?.mGameStoreList?.contains(getMockGameStore().first),
        true,
      );
    });

    test('Related Game Test', () {
      expect(
        gameDetailBloc?.mRelatedGameList?.contains(getMockGames().first),
        true,
      );
    });
  });
}
