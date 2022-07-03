import 'package:flutter/material.dart';
import 'package:gaming_hub/resources/colors.dart';

class GradientView extends StatelessWidget {
  final AlignmentGeometry begin, end;

  GradientView({required this.begin, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            Colors.transparent,
            BACKGROUND_COLOR,
          ],
        ),
      ),
    );
  }
}
