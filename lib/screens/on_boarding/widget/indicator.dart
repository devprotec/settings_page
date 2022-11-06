import 'package:flutter/material.dart';
//import 'package:mhc_consumer/utils/constants.dart';

import '../../../util/constants.dart';

class Indicator extends StatelessWidget {
  final int index;
  final int currentPage;
  final int total;
  const Indicator(
      {Key? key,
      required this.index,
      required this.total,
      required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: (MediaQuery.of(context).size.width - 80) / total,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            currentPage >= index ? Constants.pColor : const Color(0xffE6E8F3),
      ),
    );
  }
}
