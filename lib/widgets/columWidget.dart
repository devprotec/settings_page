import 'package:flutter/material.dart';
import 'package:settings_page/widgets/icon_widget.dart';

import '../util/constants.dart';

class ColumnWidget extends StatelessWidget {
  final String imageFile;
  final String settingName;
  final VoidCallback? voidCallback;
  final bool? hasSubtitle;
  final String? subTitleText;
  const ColumnWidget(
      {Key? key,
      required this.imageFile,
      required this.settingName,
      this.voidCallback, this.hasSubtitle, this.subTitleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: ListTile(
        leading: ImageWidget(imageFile: imageFile),
        //Constants.spaceMediumRow,
        title:Text(
          settingName,
          style: Constants.normalTextStyle,
        ),
       trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios),
          color: Constants.forwardIconColor,
          iconSize: 20,
          
        ),
         subtitle: hasSubtitle! ? Text(subTitleText!, style: Constants.subtitleTextStyle,):SizedBox.shrink() ,
      ),
    );
  }
}
