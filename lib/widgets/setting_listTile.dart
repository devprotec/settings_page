import 'package:settings_page/util/exports.dart';

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
      //minVerticalPadding: 25.0,
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
  final Status? status;
  //final String status;

  const SettingListTitleCompact({
    Key? key,
    required this.imageFile,
    required this.settingsName,
    this.voidCallback,
    this.hasSubtitle,
    this.subTitleText,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: status == Status.Inactive
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              ImageWidgetWithStatus(
                imageFile: imageFile,
                status: status,
              ),
              SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    settingsName,
                    style: status == Status.Inactive
                        ? Constants.inactiveSubtitleTextStyle
                        : Constants.subtitleTextStyle,
                  ),
                  status == Status.Inactive
                      ? Container()
                      : Container(
                          child: status == Status.Active
                              ? activeText()
                              : pendingText(),
                        )
                ],
              ),
            ],
          ),
          Container(
            child: status == Status.Inactive
                ? GestureDetector(
                    onTap: () {},
                    child: Text(
                      "lbl_create".tr,
                      style: AppStyle.txtPoppinsSemiBold12,
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  Widget activeText() {
    return Text(
      "lbl_active".tr,
      style: AppStyle.txtPoppinsMedium12,
    );
  }

  Widget pendingText() {
    return Text(
      "lbl_pending".tr,
      style: AppStyle.txtPoppinsMedium12Yellow900,
    );
  }
}
