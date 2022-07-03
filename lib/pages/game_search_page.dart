import 'dart:io' show Platform;

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gaming_hub/blocs/game_search_bloc.dart';
import 'package:gaming_hub/components/smart_scroll_view.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/data/vos/genre_vo.dart';
import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/pages/game_detail_page.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/resources/strings.dart';
import 'package:gaming_hub/utils/extensions.dart';
import 'package:gaming_hub/viewitems/game_search_view.dart';
import 'package:gaming_hub/widgets/loading_view.dart';
import 'package:gaming_hub/widgets/normal_text.dart';
import 'package:gaming_hub/widgets/title_text.dart';
import 'package:provider/provider.dart';

class GameSearchPage extends StatelessWidget {
  final int? genreId;

  GameSearchPage({this.genreId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameSearchBloc(genreId: genreId),
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        backgroundColor: BACKGROUND_COLOR,
        endDrawer: GameFilterSection(),
        body: Container(
          child: Stack(
            children: [
              SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MARGIN_MEDIUM_2,
                    ),
                    SearchBarSection(GAME_SEARCH_PAGE_SEARCH),
                    SizedBox(
                      height: MARGIN_MEDIUM_2,
                    ),
                    GameSearchListSection(
                        (gameId) => _navigateToGameDetailPage(context, gameId))
                  ],
                ),
              ),
              Selector<GameSearchBloc, bool>(
                selector: (context, bloc) => bloc.mIsLoading,
                builder: (context, mIsLoading, child) => Positioned.fill(
                  child: GameLoadingView(
                    visible: mIsLoading,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToGameDetailPage(BuildContext context, int gameId) {
    navigateToScreen(context, GameDetailPage(gameId));
  }
}

class GameSearchListSection extends StatelessWidget {
  final Function(int) onTapGame;

  GameSearchListSection(this.onTapGame);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmartScrollView(
        onListReached: () {
          Provider.of<GameSearchBloc>(context, listen: false)
              .onGameListEndReached();
        },
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Selector<GameSearchBloc, List<GameVO>?>(
                selector: (context, bloc) => bloc.mGameList,
                builder: (context, mGameList, child) {
                  return (mGameList?.isNotEmpty ?? false)
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2,
                          ),
                          itemCount: mGameList?.length ?? 0,
                          itemBuilder: (context, index) => GameSearchView(
                            mGameList?[index],
                            (gameId) {
                              onTapGame(gameId);
                              // _navigateToGameDetailPage(context, gameId);
                            },
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: MARGIN_XXLARGE,
                          ),
                        )
                      : Container();
                }),
            Selector<GameSearchBloc, bool>(
              selector: (context, bloc) => bloc.mIsComplete,
              builder: (context, mIsComplete, child) => SizedBox(
                height: (mIsComplete)
                    ? (Platform.isIOS)
                        ? MARGIN_XXLARGE
                        : MARGIN_MEDIUM_2
                    : MARGIN_ZERO,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBarSection extends StatelessWidget {
  final String? name;

  SearchBarSection(this.name);

  @override
  Widget build(BuildContext context) {
    GameSearchBloc bloc = Provider.of<GameSearchBloc>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.white60,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_3),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                filled: true,
                fillColor: SEARCH_COLOR,
                hintText: name ?? GAME_SEARCH_PAGE_SEARCH,
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              onSubmitted: (result) {
                bloc.getGameList();
              },
              onChanged: (text) {
                bloc.onGameNameTextChange(text);
              },
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL,
          ),
          Selector<GameSearchBloc, bool>(
            selector: (context, bloc) => bloc.mIsFilterApply,
            builder: (context, isOrderApply, child) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Badge(
                badgeColor: Colors.white,
                showBadge: isOrderApply,
                child: Icon(
                  Icons.filter_list_alt,
                  color: (isOrderApply) ? Colors.white : Colors.white60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameFilterSection extends StatelessWidget {
  const GameFilterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameSearchBloc bloc = Provider.of<GameSearchBloc>(context, listen: false);
    return Container(
      color: BACKGROUND_COLOR,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: MARGIN_MEDIUM_2,
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
                      bloc.cancelGameFilter();
                    },
                  ),
                  TitleText(GAME_SEARCH_PAGE_FILTER),
                  GestureDetector(
                    child: NormalText(GAME_SEARCH_PAGE_RESET),
                    onTap: () {
                      Navigator.of(context).pop();
                      bloc.resetGameFilter();
                    },
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
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MARGIN_LARGE,
                      ),
                      TitleText(GAME_SEARCH_PAGE_SORT_BY),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Selector<GameSearchBloc, String>(
                        selector: (context, bloc) => bloc.mOrder,
                        builder: (context, orderUI, child) => GameOrderSection(
                          orderUI,
                          (orderName) {
                            bloc.applySorting(orderName);
                          },
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_XLARGE,
                      ),
                      TitleText(GAME_SEARCH_PAGE_GENRE),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Selector<GameSearchBloc, List<GenreVO>?>(
                        selector: (context, bloc) => bloc.mGenreList,
                        builder: (context, mGenreList, child) =>
                            Selector<GameSearchBloc, List<int>>(
                          selector: (context, bloc) => bloc.mFilterGenreList,
                          builder: (context, mFilterGenreUIList, child) =>
                              GenreFilterSection(
                            mGenreList,
                            mFilterGenreUIList,
                            (genreId) {
                              bloc.addOrRemoveGenreId(genreId);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_XLARGE,
                      ),
                      TitleText(GAME_SEARCH_PAGE_PLATFORM),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Selector<GameSearchBloc, List<PlatformVO>?>(
                        selector: (context, bloc) => bloc.mPlatformList,
                        builder: (context, mPlatformList, child) =>
                            Selector<GameSearchBloc, List<int>>(
                          selector: (context, bloc) => bloc.mFilterPlatformList,
                          builder: (context, mFilterPlatformUIList, child) =>
                              PublisherFilterSection(
                            mPlatformList,
                            mFilterPlatformUIList,
                            (platformId) {
                              bloc.addOrRemovePlatformId(platformId);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_XLARGE,
                      ),
                      TitleText(GAME_SEARCH_PAGE_SEARCH_EXACT),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Selector<GameSearchBloc, bool>(
                        selector: (context, bloc) => bloc.mSearchExact,
                        builder: (context, searchExact, child) => Container(
                          decoration: BoxDecoration(
                            color: SEARCH_COLOR,
                            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                          ),
                          child: GameFilterView(
                            name: GAME_SEARCH_PAGE_SEARCH_EXACT,
                            onTapFilter: () {
                              bloc.changeSearchExact();
                            },
                            isSelect: searchExact,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_XLARGE,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: MARGIN_MEDIUM,
              margin: EdgeInsets.zero,
              color: BACKGROUND_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    indent: 0,
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: ElevatedButton(
                      onPressed: () {
                        bloc.applyGameFilter();
                        Navigator.of(context).pop();
                      },
                      child: TitleText(GAME_SEARCH_PAGE_APPLY),
                    ),
                  ),
                  SizedBox(
                    height: (Platform.isIOS) ? MARGIN_XXLARGE : MARGIN_MEDIUM_2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GameOrderSection extends StatelessWidget {
  final String orderUI;
  final Function(String) onTapOrder;

  GameOrderSection(this.orderUI, this.onTapOrder);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SEARCH_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          GameFilterView(
            name: GAME_SEARCH_PAGE_NAME,
            isSelect: (GAME_SEARCH_PAGE_NAME == orderUI),
            onTapFilter: () {
              onTapOrder(GAME_SEARCH_PAGE_NAME);
            },
          ),
          Divider(),
          GameFilterView(
            name: GAME_SEARCH_PAGE_RATING,
            isSelect: (GAME_SEARCH_PAGE_RATING == orderUI),
            onTapFilter: () {
              onTapOrder(GAME_SEARCH_PAGE_RATING);
            },
          ),
          Divider(),
          GameFilterView(
            name: GAME_SEARCH_PAGE_RELEASE,
            isSelect: (GAME_SEARCH_PAGE_RELEASE == orderUI),
            onTapFilter: () {
              onTapOrder(GAME_SEARCH_PAGE_RELEASE);
            },
          )
        ],
      ),
    );
  }
}

class GenreFilterSection extends StatelessWidget {
  final List<GenreVO>? mGenreList;
  final List<int> mFilterGenreUIList;
  final Function(int) onTapGenreFilter;

  GenreFilterSection(
      this.mGenreList, this.mFilterGenreUIList, this.onTapGenreFilter);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SEARCH_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 8,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GameFilterView(
          name: mGenreList?[index].name,
          isSelect: (mFilterGenreUIList.contains(mGenreList?[index].id)),
          onTapFilter: () {
            onTapGenreFilter(mGenreList?[index].id ?? 0);
          },
        ),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class PublisherFilterSection extends StatelessWidget {
  final List<PlatformVO>? mPlatformList;
  final List<int> mFilterPlatformUIList;
  final Function(int) onTapPublisherFilter;

  PublisherFilterSection(this.mPlatformList, this.mFilterPlatformUIList,
      this.onTapPublisherFilter);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SEARCH_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: mPlatformList?.length ?? 0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GameFilterView(
          name: mPlatformList?[index].name,
          isSelect: (mFilterPlatformUIList.contains(mPlatformList?[index].id)),
          onTapFilter: () {
            onTapPublisherFilter(mPlatformList?[index].id ?? 0);
          },
        ),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class GameFilterView extends StatelessWidget {
  final String? name;
  final Function onTapFilter;
  final bool isSelect;

  GameFilterView({
    required this.name,
    required this.onTapFilter,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: NormalText(
        name,
        color: (isSelect) ? Colors.white : Colors.white60,
      ),
      trailing: (isSelect)
          ? Icon(
              Icons.check,
              color: Colors.white,
            )
          : Icon(null),
      onTap: () {
        onTapFilter();
      },
    );
  }
}
