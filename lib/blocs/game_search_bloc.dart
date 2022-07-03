import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/models/game_model_impl.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/network/api_constants.dart';
import 'package:gaming_hub/resources/strings.dart';

class GameSearchBloc extends ChangeNotifier {
  List<GameVO>? mGameList;
  List<GenreVO>? mGenreList;
  List<PlatformVO>? mPlatformList;
  List<int> mFilterGenreList = [];
  List<int> mFilterPlatformList = [];
  bool mSearchExact = false;
  String mOrder = "";
  bool mIsLoading = false;
  bool mIsComplete = false;
  bool mIsFilterApply = false;

  int? genreId;

  List<int> _filterGenreList = [];
  List<int> _filterPlatformList = [];
  bool _searchExact = false;
  String _order = "";
  String _gameName = "";
  int _page = 1;
  bool _isDispose = false;

  Map<String, String> _orderList = {
    GAME_SEARCH_PAGE_NAME: NAME,
    GAME_SEARCH_PAGE_RATING: RATING,
    GAME_SEARCH_PAGE_RELEASE: RELEASE
  };

  GameModel _mGameModel = GameModelImpl();

  /// function to check filter changes
  Function checkEqual = const ListEquality().equals;

  GameSearchBloc({this.genreId, GameModel? gameModel}) {
    if (gameModel != null) {
      _mGameModel = gameModel;
    }
    if (genreId != null) {
      _filterGenreList.add(genreId!);
      mFilterGenreList.add(genreId!);
      mIsFilterApply = true;
      _notifySafety();
      getGameList();
    }

    _mGameModel.getGenresFromDatabase().listen((genres) {
      mGenreList = genres;
      _notifySafety();
    });

    _mGameModel.getPlatformsFromDatabase().listen((platforms) {
      mPlatformList = platforms;
      _notifySafety();
    });
  }

  void getGameList() {
    if (!mIsComplete) {
      mIsLoading = true;
      _notifySafety();
      if (_filterGenreList.isEmpty && _filterPlatformList.isEmpty) {
        _getGames();
      } else if (_filterGenreList.isEmpty && _filterPlatformList.isNotEmpty) {
        _getGamesByPlatform();
      } else if (_filterGenreList.isNotEmpty && _filterPlatformList.isEmpty) {
        _getGamesByGenre();
      } else {
        _getGamesByGenreAndPlatform();
      }
    }
  }

  void _getGames() {
    _mGameModel
        .getGames(_order, "", _gameName, _page, _searchExact)
        ?.then((games) {
      _setGamesList(games);
    }).catchError((onError) {
      var dioError = onError as DioError;
      if (dioError.response?.statusCode == 404) {
        mIsComplete = true;
      }
      mIsLoading = false;
      _notifySafety();
    });
  }

  void _getGamesByGenre() {
    _mGameModel
        .getGamesByGenre(
            _filterGenreList.join(','), _gameName, _page, _searchExact, _order)
        ?.then((games) {
      _setGamesList(games);
    }).catchError((onError) {
      var dioError = onError as DioError;
      if (dioError.response?.statusCode == 404) {
        mIsComplete = true;
      }
      mIsLoading = false;
      _notifySafety();
    });
  }

  void _getGamesByPlatform() {
    _mGameModel
        .getGamesByPlatform(_filterPlatformList.join(','), _gameName, _page,
            _searchExact, _order)
        ?.then((games) {
      _setGamesList(games);
    }).catchError((onError) {
      var dioError = onError as DioError;
      if (dioError.response?.statusCode == 404) {
        mIsComplete = true;
      }
      mIsLoading = false;
      _notifySafety();
    });
  }

  void _getGamesByGenreAndPlatform() {
    _mGameModel
        .getGamesByGenreAndPlatform(
            _filterGenreList.join(','),
            _filterPlatformList.join(','),
            _gameName,
            _page,
            _searchExact,
            _order)
        ?.then((games) {
      _setGamesList(games);
    }).catchError((onError) {
      var dioError = onError as DioError;
      if (dioError.response?.statusCode == 404) {
        mIsComplete = true;
      }
      mIsLoading = false;
      _notifySafety();
    });
  }

  void onGameNameTextChange(String gameName) {
    _gameName = gameName;
    _page = 1;
    mIsComplete = false;
  }

  void onGameListEndReached() {
    this._page++;
    getGameList();
  }

  void _setGamesList(List<GameVO>? gameList) {
    mIsLoading = false;
    if (_page == 1) {
      mGameList = gameList;
    } else {
      mGameList = [...mGameList ?? [], ...gameList ?? []];
    }
    _notifySafety();
  }

  void addOrRemoveGenreId(int genreId) {
    if (mFilterGenreList.contains(genreId)) {
      mFilterGenreList = [...mFilterGenreList];
      mFilterGenreList.remove(genreId);
    } else {
      mFilterGenreList = [...mFilterGenreList, genreId];
    }
    _notifySafety();
  }

  void addOrRemovePlatformId(int platformId) {
    if (mFilterPlatformList.contains(platformId)) {
      mFilterPlatformList = [...mFilterPlatformList];
      mFilterPlatformList.remove(platformId);
    } else {
      mFilterPlatformList = [...mFilterPlatformList, platformId];
    }
    _notifySafety();
  }

  void cancelGameFilter() {
    mFilterGenreList = _filterGenreList;
    mFilterPlatformList = _filterPlatformList;
    mSearchExact = _searchExact;
    if (_order.isNotEmpty) {
      mOrder = _orderList.keys.firstWhere((key) => _orderList[key] == _order);
    } else {
      mOrder = "";
    }
    _notifySafety();
  }

  void applyGameFilter() {
    _checkFilterChanges();
    _checkFilterApply();

    _filterGenreList = mFilterGenreList;
    _filterPlatformList = mFilterPlatformList;
    _searchExact = mSearchExact;
    if (mOrder.isNotEmpty) {
      _order = _orderList[mOrder]!;
    } else {
      _order = "";
    }
    getGameList();
  }

  void _checkFilterChanges() {
    if (!checkEqual(_filterGenreList, mFilterGenreList) ||
        !checkEqual(_filterPlatformList, mFilterPlatformList) ||
        (_order != mOrder) ||
        (_searchExact != mSearchExact)) {
      /// reset page when filters change
      _page = 1;
      mIsComplete = false;
    }
  }

  void _checkFilterApply() {
    if (mFilterGenreList.isEmpty &&
        mFilterPlatformList.isEmpty &&
        mOrder.isEmpty &&
        (!mSearchExact)) {
      mIsFilterApply = false;
    } else {
      mIsFilterApply = true;
    }
  }

  void resetGameFilter() {
    mFilterGenreList.clear();
    mFilterPlatformList.clear();
    _filterGenreList.clear();
    _filterPlatformList.clear();
    mSearchExact = false;
    _searchExact = false;
    _order = "";
    mOrder = "";
    mIsFilterApply = false;
    mIsComplete = false;
    _page = 1;
    _notifySafety();
    getGameList();
  }

  void changeSearchExact() {
    mSearchExact = !mSearchExact;
    _notifySafety();
  }

  void applySorting(String orderKey) {
    if (mOrder == orderKey) {
      mOrder = "";
    } else {
      mOrder = orderKey;
    }
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
