import '../../util/exports.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: AppDecoration.fillGray100
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Row(
                children: [
                  Text("lbl_all".tr),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
