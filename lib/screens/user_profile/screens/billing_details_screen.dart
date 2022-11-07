import 'package:mhc_customer/util/exports.dart';

class BillingDetailsScreen extends StatefulWidget {
  @override
  State<BillingDetailsScreen> createState() => _BillingDetailsScreenState();
}

class _BillingDetailsScreenState extends State<BillingDetailsScreen> {
  int currentTab = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Bank Cards'),
    const Tab(text: 'Mobile Money'),
  ];

  List screens = [BankCardScreen(), MobileMoneyScreen()];

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
            appBarTitle: "lbl_billing_details".tr,
            hasActions: true,
          ),
        ),
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            children: [
              Constants.spaceMediumColumn,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTabs(
                  tabs: tabs,
                  switchTab: (index) {
                    setState(() {
                      currentTab = index;
                    });
                  },
                ),
              ),
              screens[currentTab]
            ],
          ),
        ),
      ),
    );
  }
}

class BankCardScreen extends StatefulWidget {
  @override
  State<BankCardScreen> createState() => _BankCardScreenState();
}

class _BankCardScreenState extends State<BankCardScreen> {
  List<CreditCard> cards = [
    CreditCard(
        cardNumber: "4200756489900325",
        expiryDate: "11/23",
        isMain: true,
        cardType: "VISA"),
    CreditCard(
        cardNumber: "5550267465556732",
        expiryDate: "08/26",
        isMain: false,
        cardType: "MASTERCARD"),
    CreditCard(
        cardNumber: "4200756489900325",
        expiryDate: "01/22",
        isMain: false,
        cardType: "VISA"),
    CreditCard(
        cardNumber: "5550267465556732",
        expiryDate: "09/24",
        isMain: false,
        cardType: "MASTERCARD"),
  ];

  int? mainIndex = 0;

  void toggleMain(int index) {
    setState(() {
      mainIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return cards.length == 0
        ? Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CommonImageView(
                svgPath: "assets/images/img_billing.svg",
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Add Your First',
                style: AppStyle.poppinsTextstyle(
                  24,
                  FontWeight.w600,
                  Constants.gray900,
                ),
              ),
              Text(
                'Credit Card',
                style: AppStyle.poppinsTextstyle(
                  24,
                  FontWeight.w600,
                  Constants.gray900,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Your credit cards will be displayed here',
                style: AppStyle.poppinsTextstyle(
                  12,
                  FontWeight.w500,
                  Constants.inactiveIconColor,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Button(
                  text: 'ADD FIRST CARD',
                  onPressed: () => Get.to(() => AddCardScreen()),
                ),
              )
            ],
          )
        : Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cards.length,
                      itemBuilder: (count, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 24,
                          ),
                          child: creditCardTemplate(
                            cards[index].cardType,
                            cards[index].isMain,
                            cards[index].cardNumber,
                            cards[index].expiryDate,
                            index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24,
                    bottom: 20,
                  ),
                  child: Button(
                    text: "ADD NEW CARD",
                    onPressed: () => Get.to(() => AddCardScreen()),
                    buttonColor: Constants.lightBlue50,
                    textColor: Constants.lightBlue700,
                  ),
                ),
              ],
            ),
          );
  }

  Widget creditCardTemplate(String cardType, bool isMain, String cardNumber,
      String cardExpiry, int index) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.2865,
          width: Get.width,
          decoration: AppDecoration.outlineLightblue90019.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: CommonImageView(
            fit: BoxFit.none,
            svgPath: cardType == "VISA"
                ? "assets/images/img_visa_background.svg"
                : "assets/images/img_mastercard_background.svg",
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.2865,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CommonImageView(
                      svgPath: cardType == "VISA"
                          ? "assets/images/img_visa_logo.svg"
                          : "assets/images/img_mastercard_logo.svg",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardNumber.replaceRange(4, 11, '*' * 8),
                      style: AppStyle.poppinsTextstyle(
                          16, FontWeight.w600, Constants.gray900),
                    ),
                    Text(
                      cardExpiry,
                      style: AppStyle.poppinsTextstyle(
                          14, FontWeight.w500, Constants.lightgray900),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleMain(index);
                        });
                      },
                      child: Row(
                        children: [
                          CommonImageView(
                            imagePath: mainIndex == index
                                ? "assets/images/icon_selected_radio.png"
                                : "assets/images/icon_unselected_radio.png",
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            mainIndex == index ? 'Main' : 'Make the main',
                            style: AppStyle.poppinsTextstyle(
                                14, FontWeight.w500, Constants.lightgray900),
                          )
                        ],
                      ),
                    ),
                    mainIndex == index
                        ? Container()
                        : CommonImageView(
                            svgPath: "assets/images/icon_recycle.svg",
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileMoneyScreen extends StatefulWidget {
  @override
  State<MobileMoneyScreen> createState() => _MobileMoneyScreenState();
}

class _MobileMoneyScreenState extends State<MobileMoneyScreen> {
  List<MoMoDetails> momo = [
    MoMoDetails(
      momoName: "Eugene Asiedu",
      momoNumber: "0244128282",
      isMain: true,
      momoProvid: "MTN",
    ),
    MoMoDetails(
      momoName: "Eugene Asiedu",
      momoNumber: "0576699094",
      isMain: false,
      momoProvid: "TIGO",
    ),
    MoMoDetails(
      momoName: "David Brewu",
      momoNumber: "0274267774",
      isMain: false,
      momoProvid: "TIGO",
    ),
    MoMoDetails(
      momoName: "Oswald Gyaba",
      momoNumber: "057661555",
      isMain: false,
      momoProvid: "TIGO",
    ),
  ];

  int? mainIndex = 0;

  void toggleMain(int index) {
    setState(() {
      mainIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return momo.length == 0
        ? Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CommonImageView(
                svgPath: "assets/images/img_billing.svg",
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Add Your First',
                style: AppStyle.poppinsTextstyle(
                  24,
                  FontWeight.w600,
                  Constants.gray900,
                ),
              ),
              Text(
                'MoMo Details',
                style: AppStyle.poppinsTextstyle(
                  24,
                  FontWeight.w600,
                  Constants.gray900,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Your momo details will be displayed here',
                style: AppStyle.poppinsTextstyle(
                  12,
                  FontWeight.w500,
                  Constants.inactiveIconColor,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Button(
                  text: 'ADD FIRST MOMO',
                  onPressed: () => Get.to(
                    () => AddMomoScreen(),
                  ),
                ),
              )
            ],
          )
        : Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: momo.length,
                      itemBuilder: (count, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 24,
                          ),
                          child: momoDeatailsTemplate(
                            momo[index].momoProvid,
                            momo[index].isMain,
                            momo[index].momoName,
                            momo[index].momoNumber,
                            index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24,
                    bottom: 20,
                  ),
                  child: Button(
                    text: "ADD NEW MOMO",
                    onPressed: () => Get.to(() => AddMomoScreen()),
                    buttonColor: Constants.lightBlue50,
                    textColor: Constants.lightBlue700,
                  ),
                ),
              ],
            ),
          );
  }

  Widget momoDeatailsTemplate(
    String momoProvider,
    bool isMain,
    String momoName,
    String momoNumber,
    int index,
  ) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.2865,
          decoration: AppDecoration.outlineLightblue90019.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: CommonImageView(
              fit: BoxFit.contain,
              svgPath: momoProvider == "MTN"
                  ? "assets/images/img_momo_mtn.svg"
                  : "assets/images/img_momo_tigo.svg",
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.2865,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CommonImageView(
                      imagePath: momoProvider == "MTN"
                          ? "assets/images/img_mtn_logo.png"
                          : "assets/images/img_tigo_logo.png",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      momoNumber.replaceRange(3, 7, '*' * 5),
                      style: AppStyle.poppinsTextstyle(
                          16, FontWeight.w600, Constants.gray900),
                    ),
                    Text(
                      momoName,
                      style: AppStyle.poppinsTextstyle(
                          14, FontWeight.w500, Constants.lightgray900),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        toggleMain(index);
                      },
                      child: Row(
                        children: [
                          CommonImageView(
                            imagePath: mainIndex == index
                                ? "assets/images/icon_selected_radio.png"
                                : "assets/images/icon_unselected_radio.png",
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            mainIndex == index ? 'Main' : 'Make the main',
                            style: AppStyle.poppinsTextstyle(
                                14, FontWeight.w500, Constants.lightgray900),
                          )
                        ],
                      ),
                    ),
                    mainIndex == index
                        ? Container()
                        : CommonImageView(
                            svgPath: "assets/images/icon_recycle.svg",
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
