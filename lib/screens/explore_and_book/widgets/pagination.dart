import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class Pagination extends StatelessWidget {
  final int itemsLength;
  final int current;
  const Pagination({Key? key, required this.itemsLength, required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < itemsLength ; i++)
        Container(
          width: i==0 ? 40:6,
          height: i == 0 ? 5:6,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: current == i ? Constants.pColor : Colors.black12,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
    ]);
  }
}
