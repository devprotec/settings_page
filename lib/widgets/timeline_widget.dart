import 'package:settings_page/util/exports.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatelessWidget {
  final bool isLast;
  final bool isFirst;
  final String tileText;
  final String tileIcon;
  final Color indicatorColor;
  final Color tileTextColor;
  final bool showError;

  const TimelineWidget({
    required this.isLast,
    required this.isFirst,
    required this.tileText,
    required this.tileIcon,
    required this.indicatorColor,
    required this.tileTextColor,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        width: 32,
        height: 32,
        color: indicatorColor,
        indicator: CommonImageView(
          svgPath: tileIcon,
          width: 32,
          height: 32,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: Constants.horizontalLineColor,
        thickness: 1,
      ),
      afterLineStyle: LineStyle(
        color: Constants.horizontalLineColor,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: showError ? 10 : 0,
                ),
                Text(tileText, style: AppStyle.txtPoppinsMedium16),
                Container(
                  height: showError ? 20 : 0,
                  child: Text(
                    "msg_this_section_is".tr,
                    style: AppStyle.errorTxtPoppinsRegular14Red500,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Constants.forwardIconColor,
            )
          ],
        ),
      ),
    );
  }
}
