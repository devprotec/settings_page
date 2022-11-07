import 'package:settings_page/util/exports.dart';

class SearchSportPlaces extends StatelessWidget {
  SearchSportPlaces({Key? key}) : super(key: key);
  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppbarWidget(
          hasActions: true,
          appBarTitle: "Select Location".tr,
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      child: InputForms(
                        onTap: () {},
                        filled: true,
                        color: Constants.fromHex('#F4F5FB'),
                        placeholder: "Search for Location".tr,
                        prefixIcon: IconButton(
                          iconSize: 32,
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Constants.fromHex('#B3B3B3'),
                          ),
                        ),
                        notifier: searchNotifier,
                        obscure: false,
                        onChange: (val) {
                          searchNotifier.value = val!;
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {Get.to(() => SelectSportPlaceFilter())},
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Constants.fromHex('#F4F5FB'),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Icon(Icons.filter_list)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Constants.spaceMediumColumn,
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => SelectActivity(
                            explore: Explore.SportPlaces,
                            isOnline: false,
                          ));
                    },
                    child: SportPlace(),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    ));
  }
}
