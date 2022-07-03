import 'package:flutter/material.dart';
import 'package:gaming_hub/resources/dimens.dart';

class NormalText extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;

  NormalText(this.text, {this.color = Colors.white70, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: TEXT_REGULAR_2X,
        fontWeight: fontWeight,
      ),
    );
  }
}
