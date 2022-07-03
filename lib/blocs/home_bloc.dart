import 'package:flutter/foundation.dart';
import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/models/game_model_impl.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  List<GameVO>? mBannerGameList;
  List<GameVO>? mLastYearGamesList;
  List<GameVO>? mLastWeekGamesList;
  List<GameVO>? mComingSoonGamesList;
  List<GenreVO>? mGenreList;
  double? mActiveBannerPosition;
  String? mLastYear;

  var dateFormat = DateFormat(DATE_FORMAT);
  var currentTime = DateTime.now();

  bool _isDispose = false;

  GameModel _mGameModel = GameModelImpl();

  HomeBloc([GameModel? gameModel]) {
    /// for mock model for testing
    if (gameModel != null) {
      _mGameModel = gameModel;
    }

    /// initialize date
    int lastYear = currentTime.year - 1;

    String currentDate = dateFormat.format(currentTime);
    String lastWeek =
        dateFormat.format(currentTime.subtract(Duration(days: 7)));
    String nextWeek = dateFormat.format(currentTime.add(Duration(days: 7)));
    String yearStartDate = "$lastYear$YEAR_START_DAY_AND_MONTH";
    String yearEndDate = "$lastYear$YEAR_END_DAY_AND_MONTH";

    mLastYear = "$HOME_PAGE_LAST_YEAR $lastYear";
    _notifySafety();

    _mGameModel
        .getLastYearGamesFromDatabase("$yearStartDate,$yearEndDate")
        .listen((games) {
      mLastYearGamesList = games;
      _notifySafety();
    });

    _mGameModel
        .getLastWeekGamesFromDatabase("$lastWeek,$currentDate")
        .listen((games) {
      mLastWeekGamesList = games;
      _notifySafety();
    });

    _mGameModel
        .getComingSoonGamesFromDatabase("$currentDate,$nextWeek")
        .listen((games) {
      mComingSoonGamesList = games;
      _notifySafety();
    });

    _mGameModel.getBannerGamesFromDatabase().listen((gameList) {
      mBannerGameList = gameList;
      _notifySafety();
    });

    _mGameModel.getGenresFromDatabase().listen((genreList) {
      mGenreList = genreList;
      _notifySafety();
    });
  }

  void swipeBanner(int position) {
    mActiveBannerPosition = position.toDouble();
    _notifySafety();
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }

  void _notifySafety() {
    if (!_isDispose) {
      notifyListeners();
    }
  }
}
