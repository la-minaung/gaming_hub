import 'package:flutter/material.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/game_loading_image.dart';

class GameRoundedImage extends StatelessWidget {
  final String? imageUrl;

  GameRoundedImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        child: GameLoadingImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
