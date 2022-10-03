import 'package:settings_page/util/exports.dart';

class AppbarWidget extends StatelessWidget {
  final String appBarTitle;
  final bool hasActions;
  final Widget? trailingWidget;
  final Widget? leadingWidget;
  final Color? leadingWidgetColor;

  const AppbarWidget(
      {Key? key,
      required this.appBarTitle,
      required this.hasActions,
      this.trailingWidget,
      this.leadingWidgetColor,
      this.leadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    appBarTitle,
                    style: Constants.titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: hasActions ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        leadingWidget ??
                        Constants.arrowBacks(
                          leadingWidgetColor ?? Constants.fromHex('#6E768D'),
                        ),
                        trailingWidget ??
                            SizedBox(
                              width: 10.0,
                            ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
