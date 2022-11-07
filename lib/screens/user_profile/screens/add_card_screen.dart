// ignore_for_file: must_be_immutable

import 'package:settings_page/util/exports.dart';

class AddCardScreen extends StatelessWidget {
  TextEditingController cardController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidgetNew(
            appBarTitle: "lbl_add_new_ca".tr,
            trailingWidget: Icon(
              Icons.close,
            ),
            trailingWidgetFunction: () => Get.back(),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Number',
                      style: AppStyle.feedbackTextStyle,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFieldTemplate(
                      controller: cardController,
                      hintText: '',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiration',
                                style: AppStyle.feedbackTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextFieldTemplate(
                                controller: expirationController,
                                hintText: 'MM/YY',
                                maxLines: 1,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV',
                                style: AppStyle.feedbackTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextFieldTemplate(
                                controller: cvvController,
                                hintText: '',
                                maxLines: 1,
                                maxLenght: 3,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Button(
                  text: "ADD CARD",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
