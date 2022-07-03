import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/normal_text.dart';
import 'package:gaming_hub/widgets/game_loading_image.dart';
import 'package:gaming_hub/widgets/gradient_view.dart';
import 'package:gaming_hub/widgets/header_text.dart';

class PublisherGameView extends StatelessWidget {
  final GameVO? gameVO;
  final Function(int) onTapGame;

  PublisherGameView(this.gameVO, this.onTapGame);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapGame(gameVO?.id ?? 0);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Stack(
          children: [
            Positioned.fill(
              child: GameLoadingImage(
                imageUrl: gameVO?.backgroundImage,
              ),
            ),
            Positioned.fill(
              child: GradientView(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width:
                    (MediaQuery.of(context).size.width / 2) - MARGIN_MEDIUM_2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    HeaderText(
                      gameVO?.name,
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                    Spacer(),
                    NormalText(gameVO?.released),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
