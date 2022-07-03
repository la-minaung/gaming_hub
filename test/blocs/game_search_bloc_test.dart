import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/blocs/game_search_bloc.dart';

import '../data/models/game_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('Game Search Bloc Test', () {
    GameSearchBloc? gameSearchBloc;
    setUp(() {
      gameSearchBloc =
          GameSearchBloc(genreId: 1, gameModel: GameModelImplMock());
    });

    test('Genre Test', () {
      expect(gameSearchBloc?.mGenreList?.contains(getMockGenres().first), true);
    });

    test('Platform Test', () {
      expect(gameSearchBloc?.mPlatformList?.contains(getMockPlatforms().first),
          true);
    });

    test('Game List Test', () {
      expect(gameSearchBloc?.mGameList?.contains(getMockGames().first), true);
    });
  });
}
