import 'package:flutter/cupertino.dart';
import 'package:settings_page/util/exports.dart';

class MHCGallery extends StatelessWidget {
  List imageFileLocations = [
    "assets/images/fitness1.jpeg",
    "assets/images/fitness2.jpeg",
    "assets/images/fitness3.jpeg",
    "assets/images/nutrition1.jpeg",
    "assets/images/nutrition2.jpeg",
    "assets/images/nutrition3.jpeg",
    "assets/images/health1.jpeg",
    "assets/images/health2.jpeg",
    "assets/images/fitness1.jpeg",
    "assets/images/fitness2.jpeg",
    "assets/images/fitness3.jpeg",
    "assets/images/nutrition1.jpeg",
    "assets/images/nutrition2.jpeg",
    "assets/images/nutrition3.jpeg",
    "assets/images/health1.jpeg",
    "assets/images/health2.jpeg",
    "assets/images/fitness1.jpeg",
    "assets/images/fitness2.jpeg",
    "assets/images/fitness3.jpeg",
    "assets/images/nutrition1.jpeg",
    "assets/images/nutrition2.jpeg",
    "assets/images/nutrition3.jpeg",
    "assets/images/health1.jpeg",
    "assets/images/health2.jpeg",
    "assets/images/fitness1.jpeg",
    "assets/images/fitness2.jpeg",
    "assets/images/fitness3.jpeg",
    "assets/images/nutrition1.jpeg",
    "assets/images/nutrition2.jpeg",
    "assets/images/nutrition3.jpeg",
    "assets/images/health1.jpeg",
    "assets/images/health2.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: imageFileLocations.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    mainAxisExtent: height * 0.1079),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CommonImageView(
                        imagePath: imageFileLocations[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
