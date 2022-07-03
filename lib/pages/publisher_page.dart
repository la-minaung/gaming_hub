import 'package:flutter/material.dart';
import 'package:gaming_hub/blocs/publisher_bloc.dart';
import 'package:gaming_hub/components/smart_scroll_view.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/pages/game_detail_page.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/utils/extensions.dart';
import 'package:gaming_hub/viewitems/publisher_game_view.dart';
import 'package:gaming_hub/widgets/loading_view.dart';
import 'package:gaming_hub/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class PublisherPage extends StatelessWidget {
  final String publisherName;
  final int publisherId;

  PublisherPage(this.publisherName, this.publisherId);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PublisherBloc(publisherId),
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_2,
                      ),
                      child: TitleSectionView(publisherName: publisherName),
                    ),
                    SizedBox(
                      height: MARGIN_LARGE,
                    ),
                    PublisherGameListSection(
                        (gameId) => _navigateToGameDetailPage(context, gameId))
                  ],
                ),
              ),
              Selector<PublisherBloc, bool>(
                selector: (context, bloc) => bloc.mIsLoading,
                builder: (context, mIsLoading, child) => GameLoadingView(
                  visible: mIsLoading,
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

class TitleSectionView extends StatelessWidget {
  const TitleSectionView({
    Key? key,
    required this.publisherName,
  }) : super(key: key);

  final String publisherName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonView(),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        TitleText(publisherName),
      ],
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
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }
}

class PublisherGameListSection extends StatelessWidget {
  final Function(int) onTapGame;

  PublisherGameListSection(this.onTapGame);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmartScrollView(
        onListReached: () {
          Provider.of<PublisherBloc>(context, listen: false).onListReach();
        },
        child: Column(
          children: [
            Selector<PublisherBloc, List<GameVO>?>(
              selector: (context, bloc) => bloc.mGameList,
              builder: (context, mGameList, child) => ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                itemCount: mGameList?.length ?? 0,
                itemBuilder: (context, index) => PublisherGameView(
                  mGameList?[index],
                  (gameId) {
                    onTapGame(gameId);
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: MARGIN_LARGE,
                ),
              ),
            ),
            Selector<PublisherBloc, bool>(
              selector: (context, bloc) => bloc.mIsComplete,
              builder: (context, mIsComplete, child) => SizedBox(
                height: (mIsComplete)
                    ? (Platform.isIOS)
                        ? MARGIN_XXLARGE
                        : MARGIN_MEDIUM_2
                    : MARGIN_ZERO,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
