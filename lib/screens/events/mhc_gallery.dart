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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 34.0),
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
            Positioned(
              top: height * 0.768,
              left: 0,
              right: 0,
              bottom: height * 0.0467,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Button(
                          text: "lbl_back".tr..toUpperCase(),
                          onPressed: () {},
                          textColor: Constants.lightBlue700,
                          buttonColor: Constants.lightBlue50,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 6,
                        child: Button(
                          text: "lbl_set_cover".tr.toUpperCase(),
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
