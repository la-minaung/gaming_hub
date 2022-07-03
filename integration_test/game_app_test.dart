import 'package:flutter_test/flutter_test.dart';
import 'package:gaming_hub/data/vos/game_platform_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/publisher_vo.dart';
import 'package:gaming_hub/data/vos/rating_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/main.dart';
import 'package:gaming_hub/pages/game_detail_page.dart';
import 'package:gaming_hub/pages/game_search_page.dart';
import 'package:gaming_hub/pages/home_page.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';

import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(GameVOAdapter());
  Hive.registerAdapter(GamePlatformVOAdapter());
  Hive.registerAdapter(PlatformVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(ScreenshotVOAdapter());
  Hive.registerAdapter(RatingVOAdapter());
  Hive.registerAdapter(PublisherVOAdapter());
  Hive.registerAdapter(StoreVOAdapter());

  await Hive.openBox<GameVO>(BOX_NAME_GAME_VO);
  await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);
  await Hive.openBox<PlatformVO>(BOX_NAME_PLATFORM_VO);

  testWidgets("Tap Gaming Hub App", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    /// waiting to get data
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(HomePage), findsOneWidget);

    expect(find.text(TEST_DATA_GENRE_NAME), findsOneWidget);

    /// tap the genre to navigate to game search page
    await tester.ensureVisible(find.text(TEST_DATA_GENRE_NAME));
    await tester.tap(find.text(TEST_DATA_GENRE_NAME));

    /// wait game search data
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// find widget with text
    expect(find.byType(GameSearchPage), findsOneWidget);
    expect(find.text(TEST_DATA_GAME_NAME), findsOneWidget);

    await tester.ensureVisible(find.text(TEST_DATA_GAME_NAME));
    await tester.tap(find.text(TEST_DATA_GAME_NAME));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(GameDetailPage), findsOneWidget);
    expect(find.text(TEST_DATA_GAME_NAME), findsOneWidget);
  });
}
