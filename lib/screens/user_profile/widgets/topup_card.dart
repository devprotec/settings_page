import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_style.dart';
import '../../../util/constants.dart';
import '../../../widgets/common_image_view.dart';
import '../screens/top_up_balance.dart';


class TopUpCard extends StatelessWidget {
  final String balance;
  const TopUpCard({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constants.fromHex('#00ACE9'),
              Constants.fromHex('#0095E9'),
            ],
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Stack(children: [
        Positioned.fill(
          bottom: 0,
          left: 140,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: CommonImageView(
              svgPath: 'assets/svgs/vector22.svg',
              color: Constants.fromHex('#0064A7'),
            ),
          ),
        ),
        Positioned.fill(
          top: 25,
          left: 130,
          child: CommonImageView(
            svgPath: 'assets/svgs/vector23.svg',
            color: Constants.fromHex('#0064A7'),
            width: Get.size.width*0.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Constants.fromHex('#0064A7'),
                radius: 20,
                child: const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                'my_balance'.tr,
                style: AppStyle.poppinsTextStyle(
                    color: Constants.fromHex('#CDF1FF'),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ " + balance,
                    style: AppStyle.poppinsTextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=> TopUpBalanceScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 18,
                            color: Constants.fromHex('#00ACE9'),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            'top_up'.tr.toUpperCase(),
                            style: AppStyle.poppinsTextStyle(
                                color: Constants.fromHex('#00ACE9'),
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ],
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
        
      ]),
    );
  }
}
