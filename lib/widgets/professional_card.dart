import '../util/exports.dart';

class ProfessionalCard extends StatefulWidget {
  final ProfesionalDataModel profesionalDataModel;

  final bool isCard;
  //final Function removeProfessional;
  const ProfessionalCard(
      {Key? key, required this.profesionalDataModel, required this.isCard})
      : super(key: key);

  @override
  State<ProfessionalCard> createState() => _ProfessionalCardState();
}

class _ProfessionalCardState extends State<ProfessionalCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());
    return !widget.profesionalDataModel.isRemoved!
        ? GestureDetector(
            onTap: () {
              setState(() {
                controller.addOrganizer(widget.profesionalDataModel);
                print(controller.addedOrganizers.length);
              });
            },
            child: Container(
              padding: widget.isCard
                  ? EdgeInsets.symmetric(vertical: 8, horizontal: 10)
                  : null,
              decoration: widget.isCard
                  ? AppDecoration.outlineLightblue90019
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16)
                  : null,
              child: Row(
                //direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: widget.isCard
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.only(top: 8, bottom: 16, right: 8),
                    child: CommonImageView(
                      imagePath: widget.profesionalDataModel.imagePath,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.profesionalDataModel.Name!,
                        style: Constants.titleTextStyle,
                      ),
                      Text(
                        widget.profesionalDataModel.type!,
                        style: Constants.inactiveSubtitleTextStyle,
                      ),
                      Row(
                        // direction: Axis.horizontal,
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
                              itemBuilder: (context, _) => Icon(Icons.star,
                                  color: Constants.lightBlue500),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              widget.profesionalDataModel.rating.toString(),
                              style: AppStyle.feedbackTextStyle,
                            ),
                          ),
                          CommonImageView(
                              imagePath: "assets/images/img_divider_25.png",
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
                  widget.isCard
                      ? Obx(
                          (() => Padding(
                                padding: EdgeInsets.only(
                                    left: 6, top: 10, right: 20),
                                child: controller.addedOrganizers.indexOf(
                                            widget.profesionalDataModel) !=
                                        -1
                                    ? CommonImageView(
                                        imagePath: ImageConstant.imgVector20X20,
                                        height: getSize(20.00),
                                        width: getSize(20.00))
                                    : CommonImageView(
                                        svgPath:
                                            "assets/images/unselected_circle.svg",
                                        height: getSize(20.00),
                                        width: getSize(20.00)),
                              )),
                        )
                      : SizedBox.shrink(),
                  widget.isCard
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.profesionalDataModel.isRemoved =
                                    !widget.profesionalDataModel.isRemoved!;
                              });
                            },
                            child: CommonImageView(
                              svgPath: ImageConstant.imgClose,
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
