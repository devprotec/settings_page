import 'package:settings_page/util/exports.dart';

class AppbarWidget extends StatelessWidget {
  final String appBarTitle;
  final bool hasActions;
  final Widget? trailingWidget;

  const AppbarWidget(
      {Key? key,
      required this.appBarTitle,
      required this.hasActions,
      this.trailingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [
          Container(
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
                      Constants.arrowBacks(),
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
    );
  }
}
