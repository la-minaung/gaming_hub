import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/game_poster.dart';

class GameBannerView extends StatelessWidget {
  final GameVO? gameVO;
  final Function(int) onTapGame;

  GameBannerView({this.gameVO, required this.onTapGame});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapGame(gameVO?.id ?? 0);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            child: GamePoster(gameVO)),
      ),
    );
  }
}
