import 'package:flutter/cupertino.dart';
import 'package:settings_page/util/exports.dart';

import '../../widgets/row_bottomed_buttons.dart';

class MHCGallery extends StatefulWidget {
  @override
  State<MHCGallery> createState() => _MHCGalleryState();
}

class _MHCGalleryState extends State<MHCGallery> {
  bool isSelected = false;
  String selectedImage = "";

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

  int? optionSelected = 1000000000;

  void toggleOptionSelected(int index) {
    setState(() {
      optionSelected = index;
    });
  }

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
          clipBehavior: Clip.none,
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
                    mainAxisExtent: height * 0.1079,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleOptionSelected(index);
                            selectedImage = imageFileLocations[index];
                          },
                          child: Container(
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
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              optionSelected = 1000000000;
                              selectedImage = "";
                            });
                          },
                          child: Visibility(
                            visible: optionSelected == index,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: height * 0.768,
              left: 0,
              right: 0,
              bottom: height * 0.0567,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RowBottomedButtons(
                  leftButtonFunction: () => Get.back(),
                  rightButtonFunction: () {
                    if (selectedImage == "") {
                      Get.snackbar("Caution", "No image selected");
                    } else {
                      Get.back(result: selectedImage);
                    }
                  },
                  leftButtonTitle: "lbl_back2".tr,
                  rightButtonTitle: "lbl_set_cover".tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
