import 'package:flutter/cupertino.dart';
import 'package:settings_page/screens/explorer_booker/payment_successful.dart';
import 'package:settings_page/util/exports.dart';

class CardAddingScreen extends StatefulWidget {
  @override
  State<CardAddingScreen> createState() => _CardAddingScreenState();
}

class _CardAddingScreenState extends State<CardAddingScreen> {
  late double balance;
  bool chargeFromBalance = true;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    balance = 0.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidgetNew(
          appBarTitle: "3 Elements - Adult Class",
          hasActions: true,
          leadingWidget: Icon(
            Icons.close,
            size: 20,
          ),
          leadingWidgetColor: Constants.inactiveIconColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 26),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Constants.fromHex("#F9FCFF"),
                  border: Border.all(
                    color: Constants.fromHex("#E6E8F3"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "12 work",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.lightgray900,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Yoga, Meditation",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Constants.lightgray900,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "09:00 AM – 09:45 AM",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Constants.lightgray900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          height: 1,
                          width: width,
                          color: Constants.horizontalLineColor,
                        ),
                      ),
                      Row(
                        children: [
                          CommonImageView(
                            svgPath: "assets/images/icon_prog_loc.svg",
                            color: Constants.inactiveIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Halo Salt Gym, 6391 Elgin St. Celina...",
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Constants.lightgray900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              child: Image.asset(
                                "assets/images/img_unsplashkvmirq_32X32.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Jacob Cooper',
                            style: AppStyle.poppinsTextstyle(
                              12,
                              FontWeight.w400,
                              Constants.lightgray900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonImageView(
                            svgPath: "assets/images/wallet_balance.svg",
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "My Balance",
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Constants.gray900,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "\$ 10 000.50",
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Constants.lightgray900,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$100",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.lightgray900,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 28.0,
                        width: 48.0,
                        child: CupertinoSwitch(
                          value: chargeFromBalance,
                          trackColor: Constants.indigo50,
                          activeColor: Constants.lightBlue500,
                          onChanged: (value) {
                            setState(() {
                              chargeFromBalance = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 1,
                width: width,
                color: Constants.horizontalLineColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CommonImageView(
                        svgPath: "assets/images/img_mastercard_logo.svg",
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        "MasterCard 4567",
                        style: AppStyle.poppinsTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Constants.gray900,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Constants.forwardIconColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 1,
                width: width,
                color: Constants.horizontalLineColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Constants.lightgray900,
                          ),
                        ),
                        Text(
                          "\$100.00",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Constants.lightgray900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Taxx",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Constants.lightgray900,
                          ),
                        ),
                        Text(
                          "\$0.00",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Constants.lightgray900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Constants.lightgray900,
                          ),
                        ),
                        Text(
                          "-\$100.00",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Constants.lightgray900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Constants.gray900,
                          ),
                        ),
                        Text(
                          "\$100.00",
                          style: AppStyle.poppinsTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Constants.gray900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                onPressed: () {
                  Get.to(() => PaymentSuccesful());
                },
                text: "PAY & BOOK",
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
