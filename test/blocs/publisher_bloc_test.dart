import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/blocs/publisher_bloc.dart';

import '../data/models/game_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('Publisher Bloc Test', () {
    PublisherBloc? publisherBloc;

    setUp(() {
      publisherBloc = PublisherBloc(1, GameModelImplMock());
    });

    test('Publisher Game Test', () {
      expect(publisherBloc?.mGameList?.contains(getMockGames().first), true);
    });
  });
}
