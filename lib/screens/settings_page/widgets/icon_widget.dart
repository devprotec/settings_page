import 'package:settings_page/util/exports.dart';



class ImageWidget extends StatelessWidget {
  final String imageFile;

  const ImageWidget({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: Constants.insideIconCircleColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imageFile,
          height: 14,
          width: 14,
        ),
      ),
    );
  }
}

class ImageWidgetWithStatus extends StatelessWidget {
  final String imageFile;
  final Status? status;

  const ImageWidgetWithStatus({
    Key? key,
    required this.imageFile,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: returnCircleColor(status!),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imageFile,
          height: 14,
          width: 14,
          color: returnIconColor(status!),
        ),
      ),
    );
  }

  Color? returnCircleColor(Status status) {
    Color color = Constants.inactiveStatusColorGray;
    if (status == Status.Active) {
      color = Constants.insideIconCircleColor;
    } else if (status == Status.Pending) {
      color = Constants.pendingCircleColor;
    }
    return color;
  }

  Color? returnIconColor(Status status) {
    Color color = Constants.inactiveIconColor;
    if (status == Status.Active) {
      color = Constants.activeIconColor;
    } else if (status == Status.Pending) {
      color = Constants.yellow900;
    }
    return color;
  }
}
