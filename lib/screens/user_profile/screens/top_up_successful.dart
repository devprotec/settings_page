import 'package:mhc_customer/util/exports.dart';

class TopUpSuccessful extends StatelessWidget {
  const TopUpSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CommonAppBAr(title: 'top_up_my_balance'.tr)),
        backgroundColor: Colors.white,
        body: Container(
            width: Get.size.width,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 24, right: 24),
                      child: CommonImageView(
                          svgPath: 'assets/svgs/img_illustration_1.svg',
                          height: 218,
                          width: 327)),
                  Container(
                      width: 230,
                      margin:
                          const EdgeInsets.only(left: 24, top: 7, right: 24),
                      child: Text("top_up_success".tr,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.poppinsTextStyle(
                              color: Constants.fromHex('#0E1339'),
                              fontWeight: FontWeight.w600,
                              fontSize: 24))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("new_balance".tr + ":".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.poppinsTextStyle(
                                color: Constants.fromHex('#6E768D'),
                                fontWeight: FontWeight.w500,
                                fontSize: 13)),
                        Text("\$ " + "10 000.50".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.poppinsTextStyle(
                                color: Constants.fromHex('#6E768D'),
                                fontWeight: FontWeight.w500,
                                fontSize: 13))
                      ]),
                  const SizedBox(
                    height: 220,
                  ),
                  Button(
                    width: 327,
                    text: "done".tr.toUpperCase(),
                    onPressed: (() {}),
                  )
                ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
