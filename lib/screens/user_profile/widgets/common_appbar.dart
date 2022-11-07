import 'package:settings_page/util/exports.dart';

class CommonAppBAr extends StatelessWidget {
  final String title;
  const CommonAppBAr({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        color: Constants.fromHex('#6E768D'),
        icon: const Icon(
          Icons.arrow_back,
          size: 24,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: Text(
        title.tr,
        style: AppStyle.poppinsTextStyle(
            color: Constants.fromHex('#0E1339'),
            fontWeight: FontWeight.w600,
            fontSize: 17),
      ),
    );
  }
}
