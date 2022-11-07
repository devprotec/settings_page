import 'package:mhc_customer/util/exports.dart';

class ArticlesCard extends StatelessWidget {
  final Article article;
  const ArticlesCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 14,
      ),
      padding: EdgeInsets.all(10),
      width: 320,
      height: 210,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          image: NetworkImage(article.image),
          fit: BoxFit.cover,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 120),
          Container(
            padding: EdgeInsets.only(
              left: 5,
            ),
            width: 220,
            //height: 24,

            child: Text(
              article.title,
              style: AppStyle.poppinsTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              "Read ${article.readTime} min",
              style: AppStyle.poppinsTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
