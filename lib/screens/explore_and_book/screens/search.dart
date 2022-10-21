import 'package:settings_page/util/exports.dart';

class Search extends StatefulWidget {
  final String? searchWord;
  const Search({Key? key, this.searchWord}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ValueNotifier<String> keyword = ValueNotifier('');
  @override
  void initState() {
    keyword.value = widget.searchWord!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            InputForms(
              textStyle: Constants.normalTextStyle,
              icon: Icons.arrow_back,
              placeholder: "Search...",
              notifier: keyword,
              obscure: false,
              onChange: (val) {
                keyword.value = val!;
              },
              suffixicon: CircleAvatar(
                radius: 5,
                child: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.close),
                  iconSize: 20,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
