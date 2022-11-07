import 'package:settings_page/util/exports.dart';

class EditHeightWeight extends GetView<OnBoardingController> {
  const EditHeightWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            color: Constants.fromHex('#6E768D'),
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              color: Constants.fromHex('#6E768D'),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                size: 22,
              ),
            )
          ],
          centerTitle: true,
          title: Text(
            'health_details'.tr,
            style: AppStyle.poppinsTextstyle(
                17, FontWeight.w600, Constants.fromHex('#0E1339')),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5,
                    width: Get.size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constants.pColor),
                  ),
                  Container(
                    height: 5,
                    width: Get.size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constants.pColor),
                  )
                ],
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(child: HeightWeight()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Button(text: 'save'.tr, onPressed: () {}),
              ),
              Constants.spaceLarge,
              Constants.spaceSmall
            ],
          ),
        ));
  }
}
