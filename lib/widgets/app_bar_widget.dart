import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/constants.dart';

class AppbarWidget extends StatelessWidget {
  final String appBarTitle;
  final bool hasActions;

  const AppbarWidget(
      {Key? key, required this.appBarTitle, required this.hasActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Text(
                appBarTitle,
                style: Constants.titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Opacity(
            opacity: hasActions ? 1 : 0,
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Constants.arrowBacks(),
                  SizedBox(
                    width: 10,
                  )
                ])),
          )
        ],
      ),
    );
  }
}
