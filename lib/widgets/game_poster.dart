import 'package:flutter/material.dart';
import 'package:gaming_hub/data/vos/game_vo.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/game_loading_image.dart';
import 'package:gaming_hub/widgets/gradient_view.dart';
import 'package:gaming_hub/widgets/header_text.dart';

class GamePoster extends StatelessWidget {
  final GameVO? gameVO;
  final bool showName, showBackButton;

  GamePoster(this.gameVO, {this.showName = true, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: GameLoadingImage(
              imageUrl: gameVO?.backgroundImage,
            ),
          ),
          Positioned.fill(
            child: GradientView(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: MARGIN_XXLARGE,
                left: MARGIN_MEDIUM_2,
              ),
              child: BackButtonView(showBackButton: showBackButton),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Visibility(
              visible: showName,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.66,
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  bottom: MARGIN_MEDIUM,
                ),
                child: HeaderText(gameVO?.name),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    Key? key,
    required this.showBackButton,
  }) : super(key: key);

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Visibility(
        visible: showBackButton,
        child: Container(
          width: MARGIN_XXLARGE,
          height: MARGIN_XXLARGE,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: BACK_BUTTON_BACKGROUND_COLOR,
          ),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: MARGIN_XLARGE,
          ),
        ),
      ),
    );
  }
}
