import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/store_vo.dart';
import 'package:gaming_hub/data/vos/trailer_resolution_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';

List<GameVO> getMockGames() {
  return [
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
    GameVO(
        2,
        "Red Dead Redemption 2",
        "https://media.rawg.io/media/games/511/5118aff5091cb3efec399c808f8c598f.jpg",
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
        isBanner: false,
        isLastYear: true,
        isComingSoon: false,
        isLastWeek: false),
    GameVO(
        3,
        "Destiny 2",
        "https://media.rawg.io/media/games/34b/34b1f1850a1c06fd971bc6ab3ac0ce0e.jpg",
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
        isBanner: false,
        isLastYear: false,
        isComingSoon: true,
        isLastWeek: false),
    GameVO(
        4,
        "Limbo",
        "https://media.rawg.io/media/games/34b/34b1f1850a1c06fd971bc6ab3ac0ce0e.jpg",
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
        isBanner: false,
        isLastYear: false,
        isComingSoon: false,
        isLastWeek: true),
  ];
}

List<GenreVO> getMockGenres() {
  return [
    GenreVO(4, "Action", 100, ""),
    GenreVO(7, "Puzzle", 100, ""),
    GenreVO(15, "Sports", 100, ""),
  ];
}

List<StoreVO> getMockStores() {
  return [
    StoreVO(1, "Epic Games", "", 9999, ""),
    StoreVO(2, "Steam", "", 9999, ""),
    StoreVO(3, "Play Store", "", 9999, ""),
    StoreVO(1, "App Store", "", 9999, ""),
  ];
}

List<PlatformVO> getMockPlatforms() {
  return [
    PlatformVO(1, "PC", ""),
    PlatformVO(2, "Playstation", ""),
    PlatformVO(3, "Xbox", ""),
    PlatformVO(4, "Nintendo", ""),
  ];
}

List<GameStoreVO> getMockGameStore() {
  return [
    GameStoreVO(1, 1, 1, "www.google.com", storeName: "Epic"),
    GameStoreVO(2, 2, 2, "www.google.com", storeName: "Steam"),
    GameStoreVO(3, 3, 3, "www.google.com", storeName: "Play Store"),
  ];
}

List<ScreenshotVO> getMockScreenshots() {
  return [
    ScreenshotVO(1,
        "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg"),
    ScreenshotVO(2,
        "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg"),
    ScreenshotVO(3,
        "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg"),
  ];
}

List<TrailerVO> getMockTrailers() {
  return [
    TrailerVO(
        1, "", "", TrailerResolutionVO("www.google.com", "www.youtube.com")),
    TrailerVO(
        2, "", "", TrailerResolutionVO("www.google.com", "www.youtube.com")),
    TrailerVO(
        3, "", "", TrailerResolutionVO("www.google.com", "www.youtube.com")),
  ];
}
