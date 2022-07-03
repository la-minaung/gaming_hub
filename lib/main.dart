import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_platform_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/publisher_vo.dart';
import 'package:gaming_hub/data/vos/rating_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/pages/home_page.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerTheme: DividerThemeData(
          space: MARGIN_ZERO,
          color: Colors.white,
          indent: MARGIN_MEDIUM_2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: BUTTON_BACKGROUND_COLOR,
            padding: EdgeInsets.symmetric(
              vertical: MARGIN_MEDIUM_2,
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
