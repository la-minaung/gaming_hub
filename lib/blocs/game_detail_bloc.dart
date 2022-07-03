import 'package:flutter/cupertino.dart';
import 'package:gaming_hub/data/models/game_model.dart';
import 'package:gaming_hub/data/models/game_model_impl.dart';
import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';

class GameDetailBloc extends ChangeNotifier {
  GameVO? mGameVO;
  List<ScreenshotVO>? mScreenshotList;
  List<GameVO>? mRelatedGameList;
  List<GameStoreVO>? mGameStoreList;
  List<TrailerVO>? mGameTrailerList;

  bool _isDispose = false;
  GameModel _mGameModel = GameModelImpl();

  GameDetailBloc(int gameId, [GameModel? gameModel]) {
    if (gameModel != null) {
      _mGameModel = gameModel;
    }
    _mGameModel.getGameDetail(gameId)?.then((gameDetail) {
      mGameVO = gameDetail;
      _notifySafety();
    });

    _mGameModel.getRelatedGames(gameId, 1)?.then((relatedGames) {
      mRelatedGameList = relatedGames;
      _notifySafety();
    });

    _mGameModel.getGameStores(gameId)?.then((gameStores) {
      mGameStoreList = gameStores;
      _notifySafety();
    });

    _mGameModel.getGameScreenshots(gameId)?.then((screenshots) {
      mScreenshotList = screenshots;
      _notifySafety();
    });

    _mGameModel.getGameTrailers(gameId)?.then((gameTrailers) {
      mGameTrailerList = gameTrailers;
      _notifySafety();
    });
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
