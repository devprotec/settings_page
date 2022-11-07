import 'package:mhc_customer/util/exports.dart';

class ProgramCard extends StatelessWidget {
  final EventDataModel eventDataModel;
  final double? width;
  const ProgramCard({Key? key, this.width, required this.eventDataModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineLightblue90019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: width ?? null,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_fitness".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Constants.fromHex('#0E1339'),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "msg_yoga_meditatio".tr,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Constants.fromHex('#34405E'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  eventDataModel.programType == "Program"
                      ? CustomButton1(
                          text: "lbl_program".tr,
                          textColor: Constants.fromHex('#0085C8'),
                          backgroundColor: Constants.fromHex('#CDF1FF'),
                        )
                      : eventDataModel.programType == "Event"
                          ? CustomButton1(
                              text: "Event".tr,
                              textColor: Constants.fromHex('#A58D0E'),
                              backgroundColor: Constants.fromHex('#F9F2B2'),
                            )
                          : eventDataModel.programType == "Class"
                              ? CustomButton1(
                                  text: "Class".tr,
                                  textColor: Constants.fromHex('#8E44AD'),
                                  backgroundColor: Constants.fromHex('#EFDAF7'),
                                )
                              : SizedBox.shrink(),
                  IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "21 Noc - 21 Dec".tr,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Constants.fromHex('#34405E'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 1,
                    height: 12,
                    color: Colors.black12,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "lbl_12_classes".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Constants.fromHex('#34405E'),
                    ),
                  ),
                ],
              ),
              Text(
                "\$350".tr,
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Constants.fromHex('#0E1339'),
                ),
              ),
            ],
          ),
          Text(
            "lbl_mon_wed_fri".tr,
            style: AppStyle.poppinsTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Constants.fromHex('#6E768D'),
            ),
          ),
          Constants.spaceSmallColumn,
          Container(
            height: 1,
            width: size.width,
            decoration: BoxDecoration(
              color: Constants.fromHex('#E6E8F3'),
            ),
          ),
          Constants.spaceSmallColumn,
          eventDataModel.isOnline!
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.video_call,
                      size: 24,
                      color: Constants.fromHex('#B75FDC'),
                    ),
                    Constants.spaceSmallRow,
                    Text(
                      "lbl_online".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.poppinsTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Constants.fromHex('#B75FDC'),
                      ),
                    )
                  ],
                )
              : SizedBox.fromSize(),
          eventDataModel.isOnline! ? SizedBox(height: 5) : SizedBox.shrink(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImageView(
                imagePath: "assets/images/img_bg.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
              Constants.spaceSmallRow,
              Text(
                "lbl_justin_henning".tr,
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Constants.fromHex('#34405E'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
