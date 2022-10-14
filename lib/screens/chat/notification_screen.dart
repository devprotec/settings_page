import 'package:settings_page/util/exports.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          flexibleSpace: PreferredSize(
            child: AppbarWidget(
              hasActions: true,
              appBarTitle: "lbl_notifications".tr,
            ),
            preferredSize: Size.fromHeight(50),
          ),
        ),
      ),
    );
  }
}
