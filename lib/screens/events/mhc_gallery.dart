import 'package:flutter/cupertino.dart';
import 'package:settings_page/util/exports.dart';

class MHCGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            hasActions: true,
            appBarTitle: "lbl_mhc_gallery".tr,
            trailingWidget: Constants.trailingWidget(
              "assets/images/img_menu.svg",
              () {},
            ),
          ),
        ),
      ),
    );
  }
}
