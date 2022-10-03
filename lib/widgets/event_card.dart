

import '../util/exports.dart';


// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  EventCard({Key? key, required this.eventDataModel}) : super(key: key);
  final EventDataModel eventDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 8.0,
        bottom: 8.0,
      ),
      decoration: AppDecoration.outlineLightblue90019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                          width: 80,
                          text: eventDataModel.eventStatus!.tr,
                          textColor: eventDataModel.eventStatus == "Expired"
                              ? Constants.red500
                              : eventDataModel.eventStatus == "Draft"
                                  ? Constants.bluegray504
                                  : Constants.green600,
                          backgroundColor:
                              eventDataModel.eventStatus == "Expired"
                                  ? Constants.red51
                                  : eventDataModel.eventStatus == "Draft"
                                      ? Constants.inactiveStatusColorGray
                                      : Constants.green50),
                      // Padding(
                      //   padding: getPadding(
                      //     left: 9,
                      //     top: 5,
                      //     bottom: 5,
                      //   ),
                      //   child: CommonImageView(
                      //     svgPath: ImageConstant.imgCheckmark,
                      //     height: getSize(
                      //       13.00,
                      //     ),
                      //     width: getSize(
                      //       13.00,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: getPadding(
                      //     left: 5,
                      //     top: 7,
                      //     bottom: 4,
                      //   ),
                      //   child: Text(
                      //     eventDataModel.eventStatus!.tr,
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.left,
                      //     style: AppStyle.txtPoppinsMedium12Green600.copyWith(
                      //       height: 1.00,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(PopUpSheet(
                        listOfText: [
                          TextAndDividerForPopUp(isRedText: false, text: "Edit"),
                          TextAndDividerForPopUp(
                              isRedText: false, text: "Unpublish"),
                          TextAndDividerForPopUp(
                              isRedText: true, text: "Delete Event")
                        ],
                      ));
                    },
                    icon: Icon(Icons.more_vert),
                    color: Constants.forwardIconColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 12,
              right: 16,
            ),
            child: Text(
              eventDataModel.eventName!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.poppinsTextstyle(
                      17, FontWeight.w500, Constants.gray900)
                  .copyWith(
                height: 1.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 4,
              right: 16,
            ),
            child: Text(
                eventDataModel.eventCategory!.tr +
                    ", " +
                    eventDataModel.eventSubCategory!.tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.poppinsTextstyle(
                    14, FontWeight.w500, Constants.fromHex("#34405E"))),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 15,
              right: 16,
            ),
            child: Text(
              eventDataModel.eventStartDate!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.poppinsTextstyle(
                      14, FontWeight.w500, Constants.fromHex("#34405E"))
                  .copyWith(
                height: 1.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 5,
              right: 16,
            ),
            child: Text(
              eventDataModel.eventStartTime!.tr +
                  " - " +
                  eventDataModel.eventEndTime!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Constants.subtitleTextStyle.copyWith(
                height: 1.00,
              ),
            ),
          ),
          Constants.spaceSmallColumn,
          Container(
            height: getVerticalSize(
              1.00,
            ),
            width: getHorizontalSize(
              295.00,
            ),
            decoration: BoxDecoration(
              color: Constants.indigo50,
            ),
          ),
          eventDataModel.isOnline!
              ? Padding(
                  padding: getPadding(
                    left: 16,
                    top: 13,
                    right: 16,
                    //bottom: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: CommonImageView(
                          svgPath: ImageConstant.imgVideocamera,
                          height: getVerticalSize(
                            13.00,
                          ),
                          width: getHorizontalSize(
                            18.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          bottom: 2,
                        ),
                        child: Text("Online".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.poppinsTextstyle(14,
                                FontWeight.w400, Constants.fromHex("#B75FDC"))),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: getPadding(
              left: 16,
              top: 13,
              //right: 100,
              bottom: 19,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              ///mainAxisSize: MainAxisSize.min,
              children: [
                CommonImageView(
                  svgPath: ImageConstant.imgvideocamera48X48,
                  height: getVerticalSize(
                    18.00,
                  ),
                  width: getHorizontalSize(
                    18.00,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 8,
                  ),
                  child: Text(eventDataModel.eventLocation!.tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.poppinsTextstyle(
                          14, FontWeight.w400, Constants.gray900)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopUpSheet extends StatelessWidget {
  final List<TextAndDividerForPopUp> listOfText;
  PopUpSheet({Key? key, required this.listOfText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 222, 222),
              borderRadius: BorderRadius.circular(8)
            ),
            width: double.infinity,
            child: Column(
              children: [
                for (int i = 0; i < listOfText.length; i++) listOfText[i],
              ],
            ),
          ),
          Constants.spaceSmallColumn,
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                "lbl_cancel".tr,
                style: AppStyle.sfProDisplayextstyle(
                    18, FontWeight.w600, Color.fromARGB(255, 3, 173, 216)),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class TextAndDividerForPopUp extends StatelessWidget {
  final bool isRedText;
  final String text;
  const TextAndDividerForPopUp(
      {Key? key, required this.isRedText, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: AppStyle.sfProDisplayextstyle(17, FontWeight.w500,
              isRedText ? Constants.red500 : Color.fromARGB(255, 3, 173, 216)),
        ),
        Constants.spaceSmallColumn,
        Divider(),
        Constants.spaceSmallColumn
      ],
    );
  }
}
