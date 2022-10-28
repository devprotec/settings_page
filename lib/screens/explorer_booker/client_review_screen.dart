import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:settings_page/util/exports.dart';

class ClientReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            appBarTitle: "lbl_client_reviews".tr,
            hasActions: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              children: [
                SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          itemSize: 15,
                          initialRating: 5.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Container(
                            width: 20,
                            height: 20,
                            child: Center(
                              child: Icon(
                                Icons.star,
                                color: Constants.lightBlue500,
                              ),
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '5.0',
                        style: AppStyle.poppinsTextstyle(
                          16,
                          FontWeight.w600,
                          Constants.lightgray900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          height: 24.0,
                          width: 1,
                          color: Constants.indigo50,
                        ),
                      ),
                      Text(
                        '143 reviews',
                        style: AppStyle.poppinsTextstyle(
                          16,
                          FontWeight.w500,
                          Constants.bluegray504,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: 9,
                  physics: BouncingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 24.0, right: 24, bottom: 16),
                      child: SingleReviewLayout(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleReviewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tsan S.',
          style: AppStyle.poppinsTextstyle(
            16,
            FontWeight.w500,
            Constants.gray900,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                itemSize: 12,
                initialRating: 5.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Container(
                  child: Center(
                    child: Icon(
                      Icons.star,
                      color: Constants.lightBlue500,
                    ),
                  ),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              '5.0',
              style: AppStyle.poppinsTextstyle(
                12,
                FontWeight.w500,
                Constants.lightgray900,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '3 Elements  - Adult Class',
          style: AppStyle.poppinsTextstyle(
            14,
            FontWeight.w500,
            Constants.gray900,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants.fromHex("#EFDAF7")),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
            ),
            child: Text(
              "Class",
              style: AppStyle.poppinsTextstyle(
                12.0,
                FontWeight.w500,
                Constants.fromHex("#8E44AD"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Hannah is very positive, friendly, and effective as a customer. We developed a workout plan together to reach towards my goals. He is also eager to answer questions that I had about nutrition and workout trends. Jane finds a way to motivate and push you just the right amount, while not being overbearing. I am feeling great, more energetic, less stressed, and developing the physique that I want. Thank you Jane!',
          style: AppStyle.poppinsTextstyle(
            14,
            FontWeight.w400,
            Constants.lightgray900,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'March 8, 2021',
          style: AppStyle.poppinsTextstyle(
            12,
            FontWeight.w400,
            Constants.bluegray504,
          ),
        )
      ],
    );
  }
}
