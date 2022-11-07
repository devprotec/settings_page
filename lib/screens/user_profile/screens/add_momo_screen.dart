import 'package:mhc_customer/util/exports.dart';

class AddMomoScreen extends StatefulWidget {
  @override
  State<AddMomoScreen> createState() => _AddMomoScreenState();
}

class _AddMomoScreenState extends State<AddMomoScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String networkOperatorValue = "Select Your Network";

  var networkOperators = [
    "Select Your Network",
    "MTN",
    "Vodafone",
    "Tigo",
    "Glo",
  ];

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
            appBarTitle: "lbl_add_new_mo".tr,
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
                      'MOMO Number',
                      style: AppStyle.feedbackTextStyle,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFieldTemplate(
                      controller: numberController,
                      hintText: '',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Account Name',
                      style: AppStyle.feedbackTextStyle,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFieldTemplate(
                      controller: nameController,
                      hintText: '',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Network',
                      style: AppStyle.feedbackTextStyle,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    DropDownFieldTemplate(
                      dropDownListItems: networkOperators,
                      initialValue: networkOperatorValue,
                    ),
                  ],
                ),
                Button(
                  text: "ADD MOMO",
                  onPressed: () => Get.to(() => AddCardScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
