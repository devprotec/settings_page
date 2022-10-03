import '../../util/exports.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  var searchNotifier = ValueNotifier<String>('');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            appBarTitle: "msg_add_your_locati".tr,
            hasActions: true,
            leadingWidget: GestureDetector(
              child: closeButton(),
              onTap: () {
                Get.back();
              },
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Constants.spaceMediumColumn,
            InputForms(
                filled: true,
                color: Constants.gray150,
                placeholder: "msg_search_for_locati".tr,
                prefixIcon: Image.asset(
                  "assets/images/search.png",
                  height: 1,
                ),
                notifier: searchNotifier,
                obscure: false,
                onChange: (val) {
                  searchNotifier.value = val!;
                }),
            Constants.spaceMediumColumn,
            GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.insideIconColor),
                        child: Image.asset(
                           "assets/images/location_icon.png",
                           color: Constants.lightBlue500,
                        )),
                    Constants.spaceMediumRow,
                    Text("msg_share_your_locati".tr,
                        style: AppStyle.poppinsTextstyle(
                            17, FontWeight.w500, Constants.gray900))
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
