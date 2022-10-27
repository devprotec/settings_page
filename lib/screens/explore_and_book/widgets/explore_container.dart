
import 'package:settings_page/util/exports.dart';

class ExploreContainer extends StatelessWidget {
  final Color containerColor;

  final IconData iconData;
  final void Function() onTap;
  final String text;
  final double? isLast;
  const ExploreContainer({
    Key? key,
    required this.containerColor,
    required this.iconData,
    required this.onTap,
    required this.text,
    this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(10),
        margin:  EdgeInsets.only(top: 14, left: 16, right: isLast ?? 0),
        decoration: BoxDecoration(
          color: containerColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: containerColor,
              radius: 16,
              child: Icon(
                iconData,
                color: Colors.white,
                size: 18,
              ),
            ),
            Text(
              text,
              style: AppStyle.poppinsTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Constants.fromHex('#0E1339'),
              ),
            )
          ],
        ),
      ),
    );
  }
}


