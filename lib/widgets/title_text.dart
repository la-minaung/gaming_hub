import 'package:flutter/material.dart';
import 'package:gaming_hub/resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;

  TitleText(this.text, {this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: 1,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: TEXT_REGULAR_3X,
      ),
      textAlign: textAlign,
    );
  }
}
