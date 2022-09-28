import 'package:settings_page/util/exports.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatelessWidget {
  final bool isLast;
  final bool isFirst;
  final String tileText;
  final String tileIcon;
  final Color indicatorColor;
  final Color tileTextColor;

  const TimelineWidget({
    required this.isLast,
    required this.isFirst,
    required this.tileText,
    required this.tileIcon,
    required this.indicatorColor,
    required this.tileTextColor,
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
          imagePath: tileIcon,
          width: 32,
          height: 32,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: Constants.horizontalLineColor,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        color: Constants.horizontalLineColor,
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tileText,
                style: TextStyle(
                  color: tileTextColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
