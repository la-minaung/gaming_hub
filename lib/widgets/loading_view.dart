import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameLoadingView extends StatelessWidget {
  final bool visible;
  final Color backgroundColor;

  GameLoadingView({this.visible = true, this.backgroundColor = Colors.black26});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: Lottie.asset(
            "assets/gaming.json",
            width: MediaQuery.of(context).size.height / 5.5,
            height: MediaQuery.of(context).size.height / 5.5,
          ),
        ),
      ),
    );
  }
}
