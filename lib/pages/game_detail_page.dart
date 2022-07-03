import 'dart:io' show Platform;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gaming_hub/blocs/game_detail_bloc.dart';
import 'package:gaming_hub/data/vos/game_platform_vo.dart';
import 'package:gaming_hub/data/vos/game_store_vo.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/data/vos/rating_vo.dart';
import 'package:gaming_hub/data/vos/screenshot_vo.dart';
import 'package:gaming_hub/data/vos/trailer_vo.dart';
import 'package:gaming_hub/pages/play_trailer_page.dart';
import 'package:gaming_hub/pages/publisher_page.dart';
import 'package:gaming_hub/pages/screenshot_page.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:gaming_hub/utils/extensions.dart';
import 'package:gaming_hub/widgets/game_rounded_image.dart';
import 'package:gaming_hub/widgets/game_list_view.dart';
import 'package:gaming_hub/widgets/game_poster.dart';
import 'package:gaming_hub/widgets/header_text.dart';
import 'package:gaming_hub/widgets/loading_view.dart';
import 'package:gaming_hub/widgets/normal_text.dart';
import 'package:gaming_hub/widgets/rating_view.dart';
import 'package:gaming_hub/widgets/title_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailPage extends StatelessWidget {
  final int gameId;

  GameDetailPage(this.gameId);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameDetailBloc(gameId),
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Selector<GameDetailBloc, GameVO?>(
          selector: (context, bloc) => bloc.mGameVO,
          builder: (context, gameVO, child) {
            return Container(
              child: (gameVO != null)
                  ? Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GamePoster(
                                  gameVO,
                                  showName: false,
                                  showBackButton: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: MARGIN_MEDIUM_2,
                                  ),
                                  child: HeaderText(gameVO.name),
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: MARGIN_MEDIUM_2,
                                  ),
                                  child: PublisherSection(
                                    gameVO,
                                    (publisherId, publisherName) {
                                      _navigateToPublisherPage(
                                        context,
                                        publisherId,
                                        publisherName,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: MARGIN_MEDIUM_2,
                                  ),
                                  child: RatingSection(gameVO),
                                ),
                                SizedBox(
                                  height: MARGIN_LARGE,
                                ),
                                DescriptionSectionView(
                                  gameVO.description,
                                ),
                                SizedBox(
                                  height: MARGIN_LARGE,
                                ),
                                Selector<GameDetailBloc, List<ScreenshotVO>?>(
                                  selector: (context, bloc) =>
                                      bloc.mScreenshotList,
                                  builder: (context, mScreenshotList, child) =>
                                      MediaSectionView(mScreenshotList,
                                          (currentImage) {
                                    _navigateToScreenshotPage(
                                      context,
                                      mScreenshotList ?? [],
                                      currentImage,
                                    );
                                  }),
                                ),
                                SizedBox(
                                  height: MARGIN_LARGE,
                                ),
                                PlatformSectionView(gameVO.parentPlatforms),
                                SizedBox(
                                  height: MARGIN_LARGE,
                                ),
                                Selector<GameDetailBloc, List<GameVO>?>(
                                  selector: (context, bloc) =>
                                      bloc.mRelatedGameList,
                                  builder: (context, relatedGames, child) =>
                                      GameListView(
                                    title: GAME_DETAIL_PAGE_RELATED_GAMES,
                                    gameList: relatedGames,
                                    visible:
                                        (relatedGames?.isNotEmpty ?? false),
                                    onTapGame: (gameId) {
                                      _navigateToGameDetailPage(
                                        context,
                                        gameId,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MARGIN_LARGE,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Selector<GameDetailBloc, List<GameStoreVO>?>(
                          selector: (context, bloc) => bloc.mGameStoreList,
                          builder: (context, gameStoreList, child) =>
                              Visibility(
                            visible: (gameStoreList?.isNotEmpty ?? false),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: MARGIN_MEDIUM_2,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.shopping_bag_outlined,
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return BuySection(
                                                    gameStoreList);
                                              },
                                            );
                                          },
                                          label: TitleText(
                                            GAME_DETAIL_PAGE_BUY_NOW,
                                          ),
                                        ),
                                      ),
                                      Selector<GameDetailBloc,
                                          List<TrailerVO>?>(
                                        selector: (context, bloc) =>
                                            bloc.mGameTrailerList,
                                        builder: (context, mGameTrailerList,
                                                child) =>
                                            Visibility(
                                          visible:
                                              (mGameTrailerList?.isNotEmpty ??
                                                  false),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MARGIN_CARD_MEDIUM_2,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _navigateToPlayTrailerPage(
                                                      context,
                                                      mGameTrailerList?.first
                                                              .data?.max ??
                                                          "");
                                                },
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: SEARCH_COLOR,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: (Platform.isIOS)
                                      ? MARGIN_XXLARGE
                                      : MARGIN_MEDIUM_2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : GameLoadingView(),
            );
          },
        ),
      ),
    );
  }

  void _navigateToPublisherPage(
      BuildContext context, int publisherId, String publisherName) {
    navigateToScreen(
      context,
      PublisherPage(publisherName, publisherId),
    );
  }

  void _navigateToGameDetailPage(BuildContext context, int gameId) {
    navigateToScreen(context, GameDetailPage(gameId));
  }

  void _navigateToPlayTrailerPage(BuildContext context, String trailerUrl) {
    navigateToScreen(context, PlayTrailerPage(trailerUrl));
  }

  void _navigateToScreenshotPage(BuildContext context,
      List<ScreenshotVO> screenshotList, int currentImage) {
    navigateToScreen(context, ScreenshotPage(screenshotList, currentImage));
  }
}

class PublisherSection extends StatelessWidget {
  final GameVO gameVO;
  final Function(int publisherId, String publisherName) onTapPublisher;

  PublisherSection(this.gameVO, this.onTapPublisher);

  @override
  Widget build(BuildContext context) {
    return (gameVO.publishers?.isNotEmpty ?? false)
        ? GestureDetector(
            onTap: () {
              onTapPublisher(
                gameVO.publishers?.first.id ?? 0,
                gameVO.publishers?.first.name ?? "",
              );
            },
            child: NormalText(
              gameVO.publishers?.first.name,
              color: BUTTON_BACKGROUND_COLOR,
            ),
          )
        : Container();
  }
}

class RatingSection extends StatelessWidget {
  final GameVO gameVO;

  RatingSection(this.gameVO);

  @override
  Widget build(BuildContext context) {
    return (gameVO.ratingCount != null && gameVO.ratingCount! > 0)
        ? Row(
            children: [
              RatingView(
                rating: gameVO.rating,
                ratingCount: gameVO.ratingCount,
              ),
              SizedBox(
                width: MARGIN_SMALL,
              ),
              (gameVO.reviewsTextCount != null && gameVO.reviewsTextCount! > 0)
                  ? NormalText(
                      "${gameVO.reviewsTextCount} $GAME_DETAIL_PAGE_REVIEWS")
                  : Container(),
              SizedBox(
                width: MARGIN_SMALL,
              ),
              GestureDetector(
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: BACKGROUND_COLOR,
                    context: context,
                    builder: (context) {
                      return RatingDetailSection(gameVO);
                    },
                  );
                },
              ),
            ],
          )
        : Container();
  }
}

class RatingDetailSection extends StatelessWidget {
  final GameVO gameVO;

  RatingDetailSection(this.gameVO);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MARGIN_XXLARGE + MARGIN_MEDIUM,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.close,
                      color: Colors.white60,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: TitleText(
                        GAME_DETAIL_PAGE_RATING_DETAIL,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM + MARGIN_SMALL,
            ),
            Divider(
              indent: 0,
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: NormalText(
                GAME_DETAIL_PAGE_AVERAGE_RATING,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: Row(
                children: [
                  TitleText(gameVO.rating.toString()),
                  SizedBox(
                    width: MARGIN_MEDIUM,
                  ),
                  RatingBar(
                      itemCount: 5,
                      initialRating: gameVO.rating ?? 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: MARGIN_LARGE,
                      unratedColor: SEARCH_COLOR,
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        ),
                        empty: Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (rating) {}),
                ],
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: Text(
                '${gameVO.ratingCount} $GAME_DETAIL_PAGE_RATINGS',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_REGULAR,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            RatingBarSection(
              gameVO.ratings,
            )
          ],
        ),
      ),
    );
  }
}

class RatingBarSection extends StatelessWidget {
  final List<RatingVO>? ratings;

  RatingBarSection(this.ratings);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBarView(
          GAME_DETAIL_PAGE_RATING_FIVE,
          ratings?.firstWhereOrNull(
              (rating) => rating.id.toString() == GAME_DETAIL_PAGE_RATING_FIVE),
        ),
        RatingBarView(
          GAME_DETAIL_PAGE_RATING_FOUR,
          ratings?.firstWhereOrNull(
              (rating) => rating.id.toString() == GAME_DETAIL_PAGE_RATING_FOUR),
        ),
        RatingBarView(
          GAME_DETAIL_PAGE_RATING_THREE,
          ratings?.firstWhereOrNull((rating) =>
              rating.id.toString() == GAME_DETAIL_PAGE_RATING_THREE),
        ),
        RatingBarView(
          GAME_DETAIL_PAGE_RATING_TWO,
          ratings?.firstWhereOrNull(
              (rating) => rating.id.toString() == GAME_DETAIL_PAGE_RATING_TWO),
        ),
        RatingBarView(
          GAME_DETAIL_PAGE_RATING_ONE,
          ratings?.firstWhereOrNull(
              (rating) => rating.id.toString() == GAME_DETAIL_PAGE_RATING_ONE),
        ),
      ],
    );
  }
}

class RatingBarView extends StatelessWidget {
  final String ratingNumber;
  final RatingVO? ratingVO;

  RatingBarView(this.ratingNumber, this.ratingVO);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM_2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          SizedBox(
            width: MARGIN_SMALL,
          ),
          // TitleText("${ratingVO.id}"),
          Container(
            width: MARGIN_MEDIUM_2,
            // color: Colors.amber,
            child: Text(
              ratingNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL,
          ),
          Expanded(
            flex: 6,
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              barRadius: Radius.circular(MARGIN_MEDIUM),
              lineHeight: MARGIN_CARD_MEDIUM_2,
              percent: (ratingVO?.percent ?? 0) / 100.0,
              backgroundColor: Colors.white30,
              progressColor: Colors.white,
            ),
          ),
          // TitleText("${ratingVO.percent}%")
          SizedBox(
            width: MARGIN_SMALL,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: TitleText(
                "${ratingVO?.percent ?? 0}%",
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionSectionView extends StatelessWidget {
  final String? description;

  DescriptionSectionView(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Visibility(
        visible: (description?.isNotEmpty ?? false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(GAME_DETAIL_PAGE_DESCRIPTION),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            ReadMoreText(
              description ?? "",
              trimLines: GAME_DETAIL_PAGE_DESCRIPTION_LINE,
              trimMode: TrimMode.Line,
              trimCollapsedText: GAME_DETAIL_PAGE_SEE_MORE,
              trimExpandedText: GAME_DETAIL_PAGE_SEE_LESS,
              textAlign: TextAlign.justify,
              style: TextStyle(
                height: 1.5,
                color: Colors.white60,
                fontSize: TEXT_REGULAR_2X,
              ),
              moreStyle: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.green,
              ),
              lessStyle: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MediaSectionView extends StatelessWidget {
  final List<ScreenshotVO>? screenshotList;
  final Function(int) onTapMedia;

  MediaSectionView(this.screenshotList, this.onTapMedia);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (screenshotList?.isNotEmpty ?? false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: TitleText(GAME_DETAIL_PAGE_MEDIA),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            child: ListView.separated(
              itemCount: screenshotList?.length ?? 0,
              padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  onTapMedia(index);
                },
                child: GameRoundedImage(screenshotList?[index].image),
              ),
              separatorBuilder: (_, __) => SizedBox(
                width: MARGIN_MEDIUM_2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformSectionView extends StatelessWidget {
  final List<GamePlatformVO>? gamePlatforms;

  PlatformSectionView(this.gamePlatforms);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(GAME_DETAIL_PAGE_PLATFORMS),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: gamePlatforms
                    ?.map(
                      (gamePlatform) => PlatformChipView(gamePlatform.platform),
                    )
                    .toList() ??
                [],
          )
        ],
      ),
    );
  }
}

class PlatformChipView extends StatelessWidget {
  final PlatformVO? platform;

  PlatformChipView(this.platform);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MARGIN_MEDIUM,
        bottom: MARGIN_MEDIUM,
      ),
      child: Chip(
        elevation: MARGIN_SMALL,
        padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2,
          vertical: MARGIN_CARD_MEDIUM_2,
        ),
        label: NormalText(
          platform?.name,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: SEARCH_COLOR,
      ),
    );
  }
}

class BuySection extends StatelessWidget {
  final List<GameStoreVO>? gameStores;

  BuySection(this.gameStores);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            MARGIN_LARGE,
          ),
          topRight: Radius.circular(
            MARGIN_LARGE,
          ),
        ),
        color: BACKGROUND_COLOR,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            ),
            width: MediaQuery.of(context).size.width / 8,
            height: MARGIN_SMALL,
          ),
          SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          TitleText(GAME_DETAIL_PAGE_BUY_FROM),
          SizedBox(
            height: MARGIN_LARGE,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: gameStores?.length ?? 0,
              itemBuilder: (context, index) => StoreView(
                gameStores?[index],
                (storeUrl) async {
                  if (await canLaunch(storeUrl)) {
                    await launch(storeUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(URL_ERROR_MESSAGE),
                      ),
                    );
                  }
                },
              ),
              separatorBuilder: (_, __) => Divider(),
            ),
          )
        ],
      ),
    );
  }
}

class StoreView extends StatelessWidget {
  final GameStoreVO? gameStoreVO;
  final Function(String) onTapStore;

  StoreView(this.gameStoreVO, this.onTapStore);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: NormalText(
        gameStoreVO?.storeName,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: () {
        onTapStore(gameStoreVO?.url ?? DEFAULT_STORE_URL);
      },
    );
  }
}
