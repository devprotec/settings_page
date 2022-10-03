import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/constants.dart';
import 'button.dart';

class RowBottomedButtons extends StatelessWidget {
  final String leftButtonTitle, rightButtonTitle;
  final VoidCallback leftButtonFunction, rightButtonFunction;

  const RowBottomedButtons(
      {Key? key,
      required this.leftButtonTitle,
      required this.rightButtonTitle,
      required this.leftButtonFunction,
      required this.rightButtonFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Button(
              text: leftButtonTitle.toUpperCase(),
              onPressed: () {
                leftButtonFunction;
              },
              textColor: Constants.lightBlue700,
              buttonColor: Constants.lightBlue50,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 6,
            child: Button(
              text: rightButtonTitle.toUpperCase(),
              onPressed: () {
                rightButtonFunction;
              },
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
