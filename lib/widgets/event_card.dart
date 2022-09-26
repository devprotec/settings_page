

import 'package:settings_page/models/events_data_model.dart';

import '../util/exports.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  EventCard({Key? key}):super(key: key);
   EventDataModel? eventDataModel;
  

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
                        width: 54,
                        text: eventDataModel!.eventStatus!.tr,
                        variant: ButtonVariant.FillGreen50,
                        padding: ButtonPadding.PaddingAll6,
                        fontStyle: ButtonFontStyle.PoppinsMedium12Green600,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 9,
                          top: 5,
                          bottom: 5,
                        ),
                        child: CommonImageView(
                          svgPath: ImageConstant.imgCheckmark,
                          height: getSize(
                            13.00,
                          ),
                          width: getSize(
                            13.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 5,
                          top: 7,
                          bottom: 4,
                        ),
                        child: Text(
                          eventDataModel!.eventApprovalStatus!.tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium12Green600.copyWith(
                            height: 1.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: getVerticalSize(
                      18.00,
                    ),
                    width: getHorizontalSize(
                      3.00,
                    ),
                    margin: getMargin(
                      top: 3,
                      bottom: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bluegray200,
                    ),
                  ),
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
              eventDataModel!.eventName!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.poppinsTextstyle(14, FontWeight.w500, Constants.gray900).copyWith(
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
              eventDataModel!.eventCategory!.tr + ", " + eventDataModel!.eventSubCategory!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium12.copyWith(
                height: 1.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 15,
              right: 16,
            ),
            child: Text(
              eventDataModel!.eventDate!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium12.copyWith(
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
              eventDataModel!.eventTime!.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.poppinsTextstyle(12, FontWeight.w400, Constants.bluegray800).copyWith(
                height: 1.00,
              ),
            ),
          ),
          Container(
            height: getVerticalSize(
              1.00,
            ),
            width: getHorizontalSize(
              295.00,
            ),
            margin: getMargin(
              left: 16,
              top: 14,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Constants.indigo50,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 13,
              right: 16,
              bottom: 19,
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
                  child: Text(
                    eventDataModel!.eventLocation!.tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.poppinsTextstyle(12, FontWeight.w400, Constants.purple300).copyWith(
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
