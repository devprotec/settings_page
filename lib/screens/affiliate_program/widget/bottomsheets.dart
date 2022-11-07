import 'package:mhc_customer/util/exports.dart';

class ShareLinkBottomSheet extends StatelessWidget {
  const ShareLinkBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfListTile = <Widget>[
      listTile(Icons.local_phone_outlined, 'via_phone_num', () {
        Get.back();
        Get.bottomSheet(ViaPhoneNumber());
      }),
      listTile(Icons.email_outlined, 'via_email', () {
        Get.back();
        Get.bottomSheet(ViaEmail());
      }),
      listTile(Icons.people_alt_outlined, 'pick_from_cont', () {
        Get.back();
        Share.share('myhealthcop.com');
      })
    ];

    return GeneralContainer(
        titleText: "invite_friend", widgetList: listOfListTile);
  }

  listTile(IconData iconData, String title, Function()? function) {
    return ListTile(
      onTap: function,
      horizontalTitleGap: 0,
      leading: Icon(
        iconData,
        color: Constants.fromHex('#6E768D'),
        size: 22,
      ),
      title: Text(
        title.tr,
        style: AppStyle.poppinsTextStyle(
            color: Constants.fromHex('#34405E'),
            fontWeight: FontWeight.w400,
            fontSize: 16),
      ),
    );
  }
}

class ViaEmail extends StatelessWidget {
  ViaEmail({Key? key}) : super(key: key);
  final email = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      titleText: 'via_email',
      widgetList: [
        textAndPhone('email'.tr),
        emailInputTex(),
        Button(text: 'invite'.tr, onPressed: () {})
      ],
    );
  }

  emailInputTex() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InputForms(
          obscure: false,
          notifier: email,
          onChange: (val) {
            email.value = val!;
          }),
    );
  }
}

class ViaPhoneNumber extends StatelessWidget {
  ViaPhoneNumber({Key? key}) : super(key: key);
  final phoneNumber = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      containerSize: Get.size.height * 0.4,
      titleText: 'via_phone_num',
      widgetList: [
        textAndPhone('phone'.tr),
        countryCode(),
        Button(text: "invite".tr.toUpperCase(), onPressed: () {})
      ],
    );
  }

  countryCode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.size.height * 0.07,
            margin: const EdgeInsets.only(right: 20, top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF4F5FB),
            ),
            child: CountryCodePicker(
                onChanged: (val) {},
                initialSelection: 'GH',
                favorite: const ['+233', 'GH'],
                countryFilter: const [],
                showFlagDialog: true,
                showDropDownButton: true,
                flagWidth: 25,
                padding: EdgeInsets.zero,
                dialogSize: Size(
                  Get.size.width,
                  Get.size.height * 0.9,
                ),
                onInit: (code) {}),
          ),
          Expanded(
            child: InputForms(
              obscure: false,
              notifier: phoneNumber,
              inputType: TextInputType.number,
              onChange: (val) {
                phoneNumber.value = val!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

textAndPhone(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 11, top: 10),
    child: Text(
      text.tr,
      style: AppStyle.poppinsTextStyle(
          color: Constants.fromHex('#34405E'),
          fontWeight: FontWeight.w500,
          fontSize: 16),
    ),
  );
}

class GeneralContainer extends StatelessWidget {
  final String titleText;
  final double? containerSize;
  final List<Widget> widgetList;
  const GeneralContainer(
      {Key? key,
      required this.titleText,
      required this.widgetList,
      this.containerSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize ?? Get.size.height * 0.4,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 4,
              width: 32,
              margin: const EdgeInsets.only(
                  left: 150, top: 8, right: 130, bottom: 20),
              decoration: BoxDecoration(
                  color: Constants.fromHex('#edeef1'),
                  borderRadius: BorderRadius.circular(2))),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  color: Constants.fromHex('#D0D1DA'),
                  iconSize: 22,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 3),
                    child: Text(titleText.tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.poppinsTextStyle(
                            color: Constants.fromHex('#0E1339'),
                            fontWeight: FontWeight.w600,
                            fontSize: 18)))
              ]),
          for (int i = 0; i < widgetList.length; i++) widgetList[i]
        ],
      ),
    );
  }
}
