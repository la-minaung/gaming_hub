import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gaming_hub/resources/colors.dart';
import 'package:gaming_hub/resources/dimens.dart';
import 'package:gaming_hub/widgets/normal_text.dart';

class RatingView extends StatelessWidget {
  final int? ratingCount;
  final double? rating;

  RatingView({required this.rating, required this.ratingCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
            itemCount: 5,
            initialRating: rating ?? 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: MARGIN_MEDIUM_2,
            unratedColor: SEARCH_COLOR,
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.star,
                color: Colors.amber,
              ),
              half: Icon(
                Icons.star_half,
                color: Colors.amber,
              ),
              empty: Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
            ),
            onRatingUpdate: (rating) {}),
        SizedBox(
          width: MARGIN_SMALL,
        ),
        NormalText(
          _convertToReadableRating(rating, ratingCount),
        ),
      ],
    );
  }

  String _convertToReadableRating(double? rating, int? ratingCount) {
    return (ratingCount != null && ratingCount > 1000)
        ? "$rating (${(ratingCount / 1000.0).toStringAsFixed(1)}K)"
        : "$rating ($ratingCount)";
  }
}
