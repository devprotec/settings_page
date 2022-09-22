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

class SettingListTitleCompact extends StatelessWidget {
  final String imageFile;
  final String settingsName;
  final VoidCallback? voidCallback;
  final bool? hasSubtitle;
  final String? subTitleText;
  final bool hasTrailing;
  final Widget? trailingWidget;

  const SettingListTitleCompact({
    Key? key,
    required this.imageFile,
    required this.settingsName,
    this.voidCallback,
    this.hasSubtitle,
    this.subTitleText,
    required this.hasTrailing,
    this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return ListTile(
      onTap: voidCallback,
      leading: ImageWidget(imageFile: imageFile),
      title: Text(
        settingsName,
        style: Constants.normalTextStyle,
      ),
      trailing: hasTrailing
          ? trailingWidget
          : SizedBox(
              width: 10,
            ),
      subtitle: hasSubtitle!
          ? Text(
              subTitleText!,
              style: Constants.subtitleTextStyle,
            )
          : SizedBox.shrink(),
    ); */

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Row(
            children: [
              ImageWidget(imageFile: imageFile),
              SizedBox(
                width: 12.0,
              ),
              Text(
                settingsName,
                style: Constants.normalTextStyle,
              ),
            ],
          ),
          Container(
            child: hasTrailing
                ? trailingWidget
                : SizedBox(
                    width: 10,
                  ),
          )
        ],
      ),
    );
  }
}
