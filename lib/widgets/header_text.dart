import 'package:flutter/material.dart';
import 'package:gaming_hub/resources/dimens.dart';

class HeaderText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? height;

  HeaderText(this.text, {this.fontWeight = FontWeight.bold, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: 2,
      style: TextStyle(
        fontWeight: fontWeight,
        height: height,
        color: Colors.white,
        fontSize: TEXT_HEADING_2X,
      ),
    );
  }
}
