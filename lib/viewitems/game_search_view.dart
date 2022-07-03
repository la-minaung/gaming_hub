import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:gaming_hub/widgets/game_rounded_image.dart';
import 'package:gaming_hub/widgets/game_loading_image.dart';
import 'package:gaming_hub/widgets/normal_text.dart';
import 'package:gaming_hub/widgets/rating_view.dart';
import 'package:gaming_hub/widgets/title_text.dart';

class GameSearchView extends StatelessWidget {
  final GameVO? gameVO;
  final Function(int) onTapGame;

  GameSearchView(this.gameVO, this.onTapGame);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapGame(gameVO?.id ?? 0);
      },
      child: Column(
        children: [
          GameIconAndInfoSectionView(gameVO: gameVO),
          SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          // GameMediaSectionView(gameVO)
          GameRoundedImage((gameVO?.shortScreenShots?.isNotEmpty ?? false)
              ? gameVO?.shortScreenShots?.first.image
              : null),
        ],
      ),
    );
  }
}

class GameIconAndInfoSectionView extends StatelessWidget {
  const GameIconAndInfoSectionView({
    Key? key,
    required this.gameVO,
  }) : super(key: key);

  final GameVO? gameVO;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MARGIN_SMALL),
              child: GameLoadingImage(
                imageUrl: gameVO?.backgroundImage,
              ),
            ),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleText(gameVO?.name),
                Spacer(),
                NormalText(GAME_DESCRIPTION),
                Spacer(),
                RatingView(
                  rating: gameVO?.rating,
                  ratingCount: gameVO?.ratingCount,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GameMediaSectionView extends StatelessWidget {
  final GameVO? gameVO;

  GameMediaSectionView(this.gameVO);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        child: GameLoadingImage(
          imageUrl: (gameVO?.shortScreenShots?.isNotEmpty ?? false)
              ? gameVO?.shortScreenShots?.first.image
              : null,
        ),
      ),
    );
  }
}
