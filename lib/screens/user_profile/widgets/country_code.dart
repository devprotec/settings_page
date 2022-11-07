import 'package:settings_page/util/exports.dart';

class CountryCodeLocal extends StatelessWidget {
  final ValueNotifier<String> phoneNumber;
  const CountryCodeLocal({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
