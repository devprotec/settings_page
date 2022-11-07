import '../../../util/exports.dart';

class SportPlace extends StatelessWidget {
  final double? width;
  const SportPlace({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: AppDecoration.outlineLightblue90019
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CommonImageView(
                          imagePath: "assets/images/img_halo_logo.png",
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Halo Salt Gym",
                            style: AppStyle.poppinsTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Constants.bluegray900,
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
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    height: 12,
                                    width: 1,
                                    color: Constants.indigo50,
                                  ),
                                ),
                                Text(
                                  '13 reviews',
                                  style: AppStyle.poppinsTextstyle(
                                    12,
                                    FontWeight.w400,
                                    Constants.inactiveIconColor,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 12,
                      width: 1,
                      color: Constants.indigo50,
                    ),
                  ),
                  Text(
                    "1.5 km",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Constants.lightgray900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Opened.",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Closing at 11:00 PM",
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Constants.inactiveIconColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            top: -75,
            right: -250,
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),
    );
  }
}
