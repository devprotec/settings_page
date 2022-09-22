import 'package:flutter/material.dart';
import 'package:settings_page/widgets/icon_widget.dart';

import '../util/constants.dart';

class SettingListTitle extends StatelessWidget {
  final String imageFile;
  final String settingsName;
  final VoidCallback? voidCallback;
  final bool? hasSubtitle;
  final String? subTitleText;
  const SettingListTitle(
      {Key? key,
      required this.imageFile,
      required this.settingsName,
      this.voidCallback,
      this.hasSubtitle,
      this.subTitleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 25.0,
      onTap: voidCallback,
      leading: ImageWidget(imageFile: imageFile),
      title: Text(
        settingsName,
        style: Constants.normalTextStyle,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_forward_ios),
        color: Constants.forwardIconColor,
        iconSize: 20,
      ),
      subtitle: hasSubtitle!
          ? Text(
              subTitleText!,
              style: Constants.subtitleTextStyle,
            )
          : SizedBox.shrink(),
    );
  }
}
