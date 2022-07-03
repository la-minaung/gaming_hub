import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/blocs/home_bloc.dart';

import '../data/models/game_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home Bloc Test", () {
    HomeBloc? homeBloc;

    setUp(() {
      homeBloc = HomeBloc(GameModelImplMock());
    });

    test("Banner Game Test", () {
      expect(homeBloc?.mBannerGameList?.contains(getMockGames().first), true);
    });

    test('Genre Test', () {
      expect(homeBloc?.mGenreList?.contains(getMockGenres().first), true);
    });

    tearDown(() {
      print("Testing finish ,Tear down work");
    });
  });
}
