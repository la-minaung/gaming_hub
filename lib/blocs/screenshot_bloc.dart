import 'package:flutter/cupertino.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';

class ScreenshotBloc extends ChangeNotifier {
  List<ScreenshotVO> mScreenshotList;
  int mCurrentImage;
  bool _isDispose = false;

  ScreenshotBloc(this.mScreenshotList, this.mCurrentImage);

  void swipeScreenshot(int position) {
    mCurrentImage = position;
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
