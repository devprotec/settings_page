import 'package:settings_page/util/exports.dart';

class Search extends StatefulWidget {
  final String? searchWord;
  const Search({Key? key, this.searchWord}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ValueNotifier<String> keyword = ValueNotifier('');
  final coaches = data['coaches'];
  final blogs = data['blogs'];
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              suffixicon: Align(
                widthFactor: 1,
                heightFactor: 1,
                child: CommonImageView(
                  svgPath: 'assets/svgs/search_close.svg',
                ),
              ),
            ),
            coaches != null && coaches!.length > 0
                ? Flexible(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: coaches!.length + 1,
                      itemBuilder: ((context, index) {
                        return index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text('Coaches'.tr,
                                    style: Constants.titleTextStyle),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15.0,
                                ),
                                child: NewProfessionalCard(
                                  profesionalDataModel:
                                      ProfesionalDataModel.fromJson(
                                          coaches![index - 1]),
                                  isCard: true,
                                ),
                              );
                      }),
                    ),
                  )
                : SizedBox.shrink(),
            blogs != null && blogs!.length > 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Blogs'.tr, style: Constants.titleTextStyle),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 215,
                          padEnds: false,
                          disableCenter: true,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          reverse: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              // newArticlesCurrent = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          for (var i = 0; i < blogs!.length; i++)
                            ArticlesCard(
                              article: Article.fromJson(blogs![i]),
                            )
                        ],
                      ),
                    ],
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    ));
  }
}
