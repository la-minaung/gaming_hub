import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gaming_hub/widgets/loading_view.dart';

class GameLoadingImage extends StatelessWidget {
  final String? imageUrl;

  GameLoadingImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.black45,
      ),
      imageUrl: imageUrl ?? "",
      errorWidget: (context, url, error) => GameLoadingView(),
      // errorWidget: (context, url, error) => Icon(
      //   Icons.gamepad_sharp,
      //   color: Colors.white,
      // ),
    );
  }
}
