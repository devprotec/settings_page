import 'package:mhc_customer/util/exports.dart';

class AddressDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            hasActions: true,
            appBarTitle: "lbl_address_details".tr,
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
            child: Column(
              children: [
                CommonImageView(
                  svgPath: "assets/images/img_address_details.svg",
                ),
                SizedBox(
                  height: 22.0,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: AppDecoration.outlineLightblue90019.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImageView(
                            imagePath: "assets/images/icon_shipping_button.png",
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_shipping_addr".tr,
                                style: AppStyle.poppinsTextstyle(
                                  16.0,
                                  FontWeight.w500,
                                  Constants.gray900,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "National Museum of Ghana \nGZ-183-7623, Republic of Ghana, \nAccra, Greater Accra ",
                                style: AppStyle.poppinsTextstyle(
                                  12.0,
                                  FontWeight.w400,
                                  Constants.lightgray900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => EditShippingAddressScreen()),
                        child: CommonImageView(
                          imagePath: "assets/images/icon_edit_button.png",
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: AppDecoration.outlineLightblue90019.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImageView(
                            imagePath: "assets/images/icon_billing_button.png",
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_billing_addr".tr,
                                style: AppStyle.poppinsTextstyle(
                                  16.0,
                                  FontWeight.w500,
                                  Constants.gray900,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "National Museum of Ghana \nGZ-183-7623, Republic of Ghana, \nAccra, Greater Accra ",
                                style: AppStyle.poppinsTextstyle(
                                  12.0,
                                  FontWeight.w400,
                                  Constants.lightgray900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => EditBillingAddressScreen()),
                        child: CommonImageView(
                          imagePath: "assets/images/icon_edit_button.png",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
