import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/models/game_model_impl.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';

class PublisherBloc extends ChangeNotifier {
  List<GameVO>? mGameList;
  bool mIsLoading = false;
  bool mIsComplete = false;

  int _publisherId;
  int _page = 1;
  bool _isDispose = false;

  GameModel _mGameModel = GameModelImpl();

  PublisherBloc(this._publisherId, [GameModel? gameModel]) {
    if (gameModel != null) {
      _mGameModel = gameModel;
    }
    _getGamesByPublisher();
  }

  void _getGamesByPublisher() {
    if (!mIsComplete) {
      mIsLoading = true;
      _notifySafety();
      _mGameModel.getGamesByPublisher(_publisherId, _page)?.then((games) {
        if (_page == 1) {
          mGameList = games;
        } else {
          mGameList = [...mGameList ?? [], ...games ?? []];
        }
        mIsLoading = false;
        _notifySafety();
      }).catchError((onError) {
        var dioError = onError as DioError;
        if (dioError.response?.statusCode == 404) {
          mIsComplete = true;
        }
        mIsLoading = false;
        _notifySafety();
      });
    }
  }

  void onListReach() {
    _page++;
    _getGamesByPublisher();
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
