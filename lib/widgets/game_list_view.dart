import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/game_rounded_image.dart';
import 'package:gaming_hub/widgets/title_text.dart';

class GameListView extends StatelessWidget {
  final String? title;
  final List<GameVO>? gameList;
  final bool visible;
  final Function(int) onTapGame;

  GameListView(
      {required this.title,
      this.gameList,
      this.visible = true,
      required this.onTapGame});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2,
            ),
            child: TitleText(title),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          HorizontalGameList(
            gameList,
            (gameId) {
              onTapGame(gameId);
            },
          )
        ],
      ),
    );
  }
}

class HorizontalGameList extends StatelessWidget {
  final List<GameVO>? gameList;
  final Function(int) onTapGame;

  HorizontalGameList(this.gameList, this.onTapGame);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      child: ListView.separated(
        itemCount: gameList?.length ?? 0,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        itemBuilder: (context, index) => GestureDetector(
          child: GameRoundedImage(gameList?[index].backgroundImage),
          onTap: () {
            onTapGame(gameList?[index].id ?? 0);
          },
        ),
        separatorBuilder: (_, __) => SizedBox(
          width: MARGIN_MEDIUM,
        ),
      ),
    );
  }
}
