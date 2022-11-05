// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:settings_page/util/exports.dart';

class RatingsWidget extends StatelessWidget {
  double? itemSize;
  double? initialRating;
  int? numberOfStars;
  double? starWidth;
  double? starHeight;
  Color starColor;

  RatingsWidget({
    Key? key,
    this.itemSize = 15,
    this.initialRating = 5.0,
    this.numberOfStars = 5,
    this.starWidth = 20,
    this.starHeight = 20,
    required this.starColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize!,
      initialRating: initialRating!,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: numberOfStars!,
      itemPadding: EdgeInsets.only(right: 8.0),
      itemBuilder: (context, _) => Container(
        width: starWidth,
        height: starHeight,
        child: Center(
          child: Icon(
            Icons.star,
            color: starColor,
          ),
        ),
      ),
      onRatingUpdate: (rating) {
        //print(rating);
      },
    );
  }
}
