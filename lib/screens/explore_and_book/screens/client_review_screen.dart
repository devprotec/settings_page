// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mhc_customer/util/exports.dart';

class ClientReviewScreen extends StatelessWidget {
  List<ClientReviewModel> clientReviewList = [
    ClientReviewModel(
      name: "Kwesi T.",
      className: "3 Elements - Adult Class",
      type: "Event",
      message:
          "Hannah is very positive, friendly, and effective as a customer. We developed a workout plan together to reach towards my goals. He is also eager to answer questions that I had about nutrition and workout trends!",
      numberOfStars: 2,
      date: "March 8, 2021",
    ),
    ClientReviewModel(
      name: "David B.",
      className: "3 Elements - Adult Class",
      type: "Class",
      message: "Class was boring today",
      numberOfStars: 5,
      date: "March 8, 2021",
    ),
    ClientReviewModel(
      name: "Cameron W.",
      className: "3 Elements - Adult Class",
      type: "Program",
      message: "Session was very interesting. Good caoch",
      numberOfStars: 5,
      date: "March 8, 2021",
    ),
    ClientReviewModel(
      name: "Jane C.",
      className: "3 Elements - Adult Class",
      type: "Event",
      message: "It ccan improve",
      numberOfStars: 4,
      date: "March 8, 2021",
    ),
    ClientReviewModel(
      name: "Tereza C.",
      className: "3 Elements - Adult Class",
      type: "Program",
      message: "Very intense. Keep it up coach. Health and wellness goals",
      numberOfStars: 1,
      date: "March 8, 2021",
    ),
  ];

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
                  itemCount: clientReviewList.length,
                  physics: BouncingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 24.0, right: 24, bottom: 16),
                      child: SingleReviewLayout(
                        name: clientReviewList[index].name,
                        numberOfStars: clientReviewList[index].numberOfStars,
                        className: clientReviewList[index].className,
                        type: clientReviewList[index].type,
                        message: clientReviewList[index].message,
                        date: clientReviewList[index].date,
                      ),
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
  String name;
  String className;
  String type;
  String message;
  int numberOfStars;
  String date;

  SingleReviewLayout({
    Key? key,
    required this.name,
    required this.className,
    required this.type,
    required this.message,
    required this.numberOfStars,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
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
                initialRating: numberOfStars.toDouble(),
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
              numberOfStars.toString(),
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
          className,
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
            color: type == "Class"
                ? Constants.fromHex("#EFDAF7")
                : type == "Program"
                    ? Constants.fromHex("#CDF1FF")
                    : Constants.fromHex("#F9F2B2"),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
            ),
            child: Text(
              type,
              style: AppStyle.poppinsTextstyle(
                12.0,
                FontWeight.w500,
                type == "Class"
                    ? Constants.fromHex("#8E44AD")
                    : type == "Program"
                        ? Constants.fromHex("#0085C8")
                        : Constants.fromHex("#A58D0E"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          message,
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
          date,
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
