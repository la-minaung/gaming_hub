import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gaming_hub/blocs/screenshot_bloc.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/loading_view.dart';
import 'package:gaming_hub/widgets/title_text.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ScreenshotPage extends StatelessWidget {
  final List<ScreenshotVO> screenshotList;
  final int currentImage;

  ScreenshotPage(this.screenshotList, this.currentImage);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScreenshotBloc(screenshotList, currentImage),
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SafeArea(
          child: Container(
            child: Selector<ScreenshotBloc, List<ScreenshotVO>>(
              selector: (context, bloc) => bloc.mScreenshotList,
              builder: (context, mScreenshotList, child) =>
                  Selector<ScreenshotBloc, int>(
                selector: (context, bloc) => bloc.mCurrentImage,
                builder: (context, mCurrentImage, child) => Stack(
                  children: [
                    Positioned.fill(
                      child: ImageSlider(mScreenshotList, mCurrentImage),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ImagePositionView(mScreenshotList, mCurrentImage),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: BackButtonView(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: MARGIN_MEDIUM_2,
          right: MARGIN_MEDIUM_2,
        ),
        padding: EdgeInsets.all(MARGIN_SMALL),
        decoration: BoxDecoration(
          color: Colors.white60,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ImagePositionView extends StatelessWidget {
  final List<ScreenshotVO> screenshots;
  final int currentImage;

  ImagePositionView(this.screenshots, this.currentImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM_2,
        ),
      ),
      margin: EdgeInsets.only(top: MARGIN_MEDIUM_2),
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
        vertical: MARGIN_MEDIUM,
      ),
      child: TitleText("${currentImage + 1}/${screenshots.length}"),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<ScreenshotVO> screenshots;
  final int currentImage;

  ImageSlider(this.screenshots, this.currentImage);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: currentImage),
      children: screenshots
          .map(
            (screenshot) => PhotoView(
              loadingBuilder: (context, event) => GameLoadingView(
                backgroundColor: Colors.transparent,
              ),
              backgroundDecoration: BoxDecoration(
                color: BACKGROUND_COLOR,
              ),
              imageProvider: CachedNetworkImageProvider(
                screenshot.image,
              ),
            ),
          )
          .toList(),
      onPageChanged: (index) {
        Provider.of<ScreenshotBloc>(context, listen: false)
            .swipeScreenshot(index);
      },
    );
  }
}
