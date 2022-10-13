import 'package:get/get.dart';


import '../../../theme/app_style.dart';
import '../../../util/constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/common_image_view.dart';
import '../models/payment_method_model.dart';
import '../models/top_up_controller.dart';
import '../widgets/common_appBar.dart';
import 'package:flutter/material.dart';

import '../widgets/payment_methods_bottomsheet.dart';
import 'top_up_successful.dart';

class TopUpBalanceScreen extends StatefulWidget {
  const TopUpBalanceScreen({Key? key}) : super(key: key);
  @override
  State<TopUpBalanceScreen> createState() => _TopUpBalanceScreenState();
}

class _TopUpBalanceScreenState extends State<TopUpBalanceScreen> {
  String amount = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final topuController = Get.put(TopUpController());
    Get.put(TopUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppBAr(
          title: 'top_up_my_balance'.tr,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    PaymentMethodBottomSheet(),
                  );
                },
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Constants.fromHex('#190064a7'),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(
                            0,
                            2,
                          ),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            topuController
                                        .selectedPaymentVendo.value.vendoName ==
                                    null
                                ? const SizedBox.shrink()
                                : CommonImageView(
                                    imagePath: getVendorImage(topuController
                                        .selectedPaymentVendo.value.vendoName!),
                                    height: 22,
                                    width: 35),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              topuController.selectedPaymentVendo.value
                                          .vendoName !=
                                      null
                                  ? topuController.selectedPaymentVendo.value
                                          .vendoName!.tr +
                                      " - " +
                                      topuController.selectedPaymentVendo.value
                                          .lastDigits!.tr
                                  : "choose_payment".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.poppinsTextStyle(
                                color: Constants.fromHex('#0e1339'),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Constants.spaceMedium,
              Container(
                width: double.infinity,
                height: 85,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "\$",
                            style: AppStyle.poppinsTextStyle(
                              color: Constants.fromHex('#0E1339'),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      IntrinsicWidth(
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() {
                              amount = val;
                            });
                          },
                          style: AppStyle.poppinsTextStyle(
                            color: Constants.fromHex('#0E1339'),
                            fontWeight: FontWeight.w600,
                            fontSize: 50,
                          ),
                          cursorWidth: 5,
                          cursorColor: Colors.black,
                          cursorHeight: 60,
                          maxLength: 10,
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            counter: const Offstage(),
                            hintStyle: AppStyle.poppinsTextStyle(
                              color: Constants.fromHex('#AEB2BF'),
                              fontWeight: FontWeight.w600,
                              fontSize: 55,
                            ),
                            hintText: "0",
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        "current_balance".tr + ": ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#6d768d'),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 1),
                      child: Text(
                        "\$ " + "10 000.50".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#343f5e'),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Constants.spaceMedium,
              Constants.spaceSmall,
              controller.text == '' || controller.text == '0'
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: Center(
                        child: Text('top_up'.tr.toUpperCase(),
                            style: AppStyle.poppinsTextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Constants.fromHex('#D2D5E4'),
                            Constants.fromHex('#AEB6BF'),
                          ]),
                          borderRadius: BorderRadius.circular(12)),
                    )
                  : Button(
                      text: "top_up".tr.toUpperCase(),
                      onPressed: () {
                        Get.to(() => const TopUpSuccessful());
                      },
                      
                    ),
              Constants.spaceMedium,
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: fixedAmounts.length,
                  itemBuilder: ((context, index) {
                    return fixedAmountContainer(
                        amountToBePaid: fixedAmounts[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fixedAmountContainer({required String amountToBePaid}) {
    return InkWell(
      onTap: () {
        setState(() {
          controller.text = amountToBePaid;
          amount = amountToBePaid;
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length));
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Constants.fromHex('#CDF1FF'),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            "\$ " + amountToBePaid.tr.toUpperCase(),
            style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#0085C8'),
                fontWeight: FontWeight.w600,
                fontSize: 13),
          )),
    );
  }
}

final fixedAmounts = ["50", '100', '200', '400', '500', '1000', '2000'];


/*
Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            "\$",
                            style: poppinsTextStyle(
                                color: Constants.fromHex('#0E1339'),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 60,
                            width: Get.size.width * 0.4,
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                setState(() {
                                  amount = val;
                                });
                              },
                              style: poppinsTextStyle(
                                  color: Constants.fromHex('#0E1339'),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 50,),
                              cursorWidth: 5,
                              cursorColor: Colors.black,
                              cursorHeight: 50,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintStyle: poppinsTextStyle(
                                  color: Constants.fromHex('#AEB2BF'),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 55,
                                ),
                                hintText: "0",
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),*/