import '../../../util/exports.dart';

class NewProfessionalCard extends StatefulWidget {
  final ProfesionalDataModel profesionalDataModel;
  final double? width;
  final bool isCard;
  //final Function removeProfessional;
  const NewProfessionalCard(
      {Key? key,
      required this.profesionalDataModel,
      required this.isCard,
      this.width})
      : super(key: key);

  @override
  State<NewProfessionalCard> createState() => _NewProfessionalCardState();
}

class _NewProfessionalCardState extends State<NewProfessionalCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(() => CoachDetails(
              coach: widget.profesionalDataModel,
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: widget.width ?? null,
        decoration: AppDecoration.outlineLightblue90019
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: CommonImageView(
                            imagePath: widget.profesionalDataModel.imagePath,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.profesionalDataModel.Name!,
                              style: Constants.normalTextStyle,
                            ),
                            Row(
                              children: [
                                IgnorePointer(
                                  ignoring: true,
                                  child: RatingBar.builder(
                                    itemSize: 15,
                                    initialRating:
                                        widget.profesionalDataModel.rating!,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Constants.lightBlue500),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    widget.profesionalDataModel.rating
                                        .toString(),
                                    style: AppStyle.feedbackTextStyle,
                                  ),
                                ),
                                CommonImageView(
                                    imagePath:
                                        "assets/images/img_divider_25.png",
                                    height: 13,
                                    width: 3),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    widget.profesionalDataModel.numberOfReviews
                                            .toString() +
                                        " reviews",
                                    style: Constants.inactiveSubtitleTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Constants.spaceSmallColumn,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Individual Rate'.tr,
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constants.fromHex('#34405E'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$20",
                                  style: AppStyle.poppinsTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Constants.fromHex('#0E1339'),
                                  ),
                                ),
                                Text(
                                  '/hour',
                                  style: AppStyle.poppinsTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.fromHex('#6E768D'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.black12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Group Rate'.tr,
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constants.fromHex('#34405E'),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$250",
                                  style: AppStyle.poppinsTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Constants.fromHex('#0E1339'),
                                  ),
                                ),
                                Text(
                                  '/hour',
                                  style: AppStyle.poppinsTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.fromHex('#6E768D'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.black12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Distance'.tr,
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constants.fromHex('#34405E'),
                              ),
                            ),
                            Text(
                              '3.5 km',
                              style: AppStyle.poppinsTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Constants.fromHex('#0E1339'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Positioned.fill(
                  top: -75,
                  right: -275,
                  child: GestureDetector(
                    child: Icon(Icons.favorite_outline),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
