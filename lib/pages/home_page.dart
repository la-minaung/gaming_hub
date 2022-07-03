import 'dart:io' show Platform;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gaming_hub/blocs/home_bloc.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/pages/game_detail_page.dart';
import 'package:gaming_hub/pages/game_search_page.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:gaming_hub/utils/extensions.dart';
import 'package:gaming_hub/viewitems/game_banner_view.dart';
import 'package:gaming_hub/widgets/game_list_view.dart';
import 'package:gaming_hub/widgets/normal_text.dart';
import 'package:gaming_hub/widgets/title_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Selector<HomeBloc, List<GameVO>?>(
          selector: (context, bloc) => bloc.mBannerGameList,
          builder: (context, bannerGameList, child) => SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                    ),
                    child: TitleSectionView(
                      () {
                        _navigateToGameSearchPage(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                  Selector<HomeBloc, List<GameVO>?>(
                    selector: (context, bloc) => bloc.mBannerGameList,
                    builder: (context, bannerGameList, child) =>
                        Selector<HomeBloc, double?>(
                      selector: (context, bloc) => bloc.mActiveBannerPosition,
                      builder: (context, activeBannerPosition, child) =>
                          BannerSectionView(
                        bannerGameList?.take(8).toList(),
                        activeBannerPosition,
                        (gameId) {
                          _navigateToGameDetailPage(context, gameId);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  Selector<HomeBloc, String?>(
                    selector: (context, bloc) => bloc.mLastYear,
                    builder: (context, mLastYear, child) =>
                        Selector<HomeBloc, List<GameVO>?>(
                      selector: (context, bloc) => bloc.mLastYearGamesList,
                      builder: (context, mLastYearGamesList, child) =>
                          GameListView(
                        title: mLastYear,
                        gameList: mLastYearGamesList,
                        visible: (mLastYearGamesList?.isNotEmpty ?? false),
                        onTapGame: (gameId) {
                          _navigateToGameDetailPage(context, gameId);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  Selector<HomeBloc, List<GameVO>?>(
                    selector: (context, bloc) => bloc.mLastWeekGamesList,
                    builder: (context, mLastThirtyDaysGamesList, child) =>
                        GameListView(
                      title: HOME_PAGE_LAST_WEEK,
                      gameList: mLastThirtyDaysGamesList,
                      visible: (mLastThirtyDaysGamesList?.isNotEmpty ?? false),
                      onTapGame: (gameId) {
                        _navigateToGameDetailPage(context, gameId);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  Selector<HomeBloc, List<GameVO>?>(
                    selector: (context, bloc) => bloc.mComingSoonGamesList,
                    builder: (context, mUpcomingGamesList, child) =>
                        GameListView(
                      title: HOME_PAGE_COMING_SOON,
                      gameList: mUpcomingGamesList,
                      visible: (mUpcomingGamesList?.isNotEmpty ?? false),
                      onTapGame: (gameId) {
                        _navigateToGameDetailPage(context, gameId);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  Selector<HomeBloc, List<GenreVO>?>(
                    selector: (context, bloc) => bloc.mGenreList,
                    builder: (context, mGenreList, child) => GenreSectionView(
                      mGenreList,
                      (genreId) {
                        _navigateToGameSearchPage(context, genreId: genreId);
                      },
                      visibility: (mGenreList?.isNotEmpty ?? false),
                    ),
                  ),
                  SizedBox(
                    height: (Platform.isIOS) ? MARGIN_XXLARGE : MARGIN_MEDIUM_2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToGameSearchPage(BuildContext context, {int? genreId}) {
    navigateToScreen(context, GameSearchPage(genreId: genreId));
  }

  void _navigateToGameDetailPage(BuildContext context, int gameId) {
    navigateToScreen(context, GameDetailPage(gameId));
  }
}

class GenreSectionView extends StatelessWidget {
  final List<GenreVO>? genreList;
  final Function(int) onTapGenre;
  final bool visibility;

  GenreSectionView(this.genreList, this.onTapGenre, {required this.visibility});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleText(HOME_PAGE_GENRE_SECTION_TITLE),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: NormalText(
              HOME_PAGE_GENRE_SECTION_MESSAGE,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: genreList?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (BuildContext context, int index) => GenreView(
              genreList?[index],
              (genreId) {
                onTapGenre(genreId);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GenreView extends StatelessWidget {
  final GenreVO? genreVO;
  final Function(int) onTapGenre;

  GenreView(this.genreVO, this.onTapGenre);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapGenre(genreVO?.id ?? 0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM,
          vertical: MARGIN_MEDIUM,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              BUTTON_BACKGROUND_COLOR,
              VIOLET_COLOR,
            ],
          ),
          borderRadius: BorderRadius.circular(
            MARGIN_MEDIUM,
          ),
        ),
        child: Center(
          child: NormalText(
            genreVO?.name,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class BannerSectionView extends StatelessWidget {
  final List<GameVO>? gameList;
  final double? activeBannerPosition;
  final Function(int) onTapBanner;

  BannerSectionView(this.gameList, this.activeBannerPosition, this.onTapBanner);

  @override
  Widget build(BuildContext context) {
    return (gameList?.isNotEmpty ?? false)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (position) {
                    Provider.of<HomeBloc>(context, listen: false)
                        .swipeBanner(position);
                  },
                  children: gameList
                          ?.map((game) => GameBannerView(
                                gameVO: game,
                                onTapGame: (gameId) {
                                  onTapBanner(gameId);
                                },
                              ))
                          .toList() ??
                      [],
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM,
              ),
              Container(
                margin: EdgeInsets.only(left: MARGIN_MEDIUM_2 - MARGIN_SMALL),
                child: DotsIndicator(
                  dotsCount: gameList?.length ?? 0,
                  position: activeBannerPosition ?? 0,
                  decorator: DotsDecorator(
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MARGIN_SMALL),
                    ),
                    activeSize: const Size(MARGIN_MEDIUM_3, MARGIN_MEDIUM),
                    activeColor: BUTTON_BACKGROUND_COLOR,
                    size: Size.square(MARGIN_MEDIUM),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}

class TitleSectionView extends StatelessWidget {
  final Function onTapSearch;

  TitleSectionView(this.onTapSearch);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          APP_NAME,
          style: TextStyle(
              fontSize: TEXT_BIG,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            onTapSearch();
          },
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: MARGIN_XLARGE,
          ),
        )
      ],
    );
  }
}
