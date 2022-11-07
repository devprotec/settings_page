import 'package:mhc_customer/util/exports.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final User user;
  const PersonalDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateOfBirth = mapDate(user.dataOfBirth!);
    final day = dateOfBirth[0];
    final month = dateOfBirth[1];
    final year = dateOfBirth[2];
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(children: [
          Image.asset(
            "assets/images/image.png",
            height: Get.size.height * 0.6,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120.0, top: 60),
            child: Text(
              'personal_details'.tr,
              style: AppStyle.poppinsTextStyle(
                  color: Constants.fromHex('#0E1339'),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => EditPersonalDetails(
                              user: user,
                            ));
                      },
                      icon: const Icon(Icons.edit_outlined))
                ]),
          ),
          Positioned(
            top: height * 0.13493,
            left: width * 0.064,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/images/active.png"),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          user.username!,
                          style: AppStyle.poppinsTextStyle(
                              color: Constants.fromHex("#0E1339"),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                day + '.' + month + '.' + year,
                                style: AppStyle.poppinsTextStyle(
                                    color: Constants.fromHex('#34405E'),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black45),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, top: 10),
                              child: Text(
                                user.gender!.name.capitalize!,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.3278,
            left: width * 0.088,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        user.phonenumber!,
                        style: AppStyle.poppinsTextStyle(
                            color: Constants.fromHex('#34405E'),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        user.email!,
                        style: AppStyle.poppinsTextStyle(
                            color: Constants.fromHex('#34405E'),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: width * 0.048,
            right: width * 0.048,
            child: Container(
              height: height * 0.325,
              child: CommonImageView(
                  svgPath: 'assets/svgs/img_boostyourinmu.svg',
                  width: double.infinity),
            ),
          ),
          Positioned(
            top: height * 0.4407,
            left: width * 0.064,
            right: width * 0.064,
            child: Container(
              height: height * 0.32884,
              //margin: const EdgeInsets.only(top: 300, left: 15, right: 15, bottom: 230),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFFE6E8F3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      //crossAxisAlignment: CrossAxisAlignment.start, children: [
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: Constants.fromHex('#CDF1FF'),
                        child: Icon(
                          Icons.health_and_safety,
                          color: Constants.fromHex('#00ACE9'),
                          size: 18,
                        ),
                      ),
                      //const SizedBox(width: 12),
                      title: Text(
                        'health_details'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Get.to(const EditBloodType());
                          },
                          icon: const Icon(Icons.edit_outlined))),
                  Constants.spaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      weightHeightBlood(
                          user.weight!.toInt().toString(), 'kg', 'Weight'),
                      Container(
                        width: 1,
                        color: Colors.black26,
                        height: 40,
                      ),
                      weightHeightBlood(user.height.toString(), 'cm', 'Height'),
                      Container(
                        width: 1,
                        color: Colors.black26,
                        height: 40,
                      ),
                      weightHeightBlood(user.bloodType!, '+', 'Blood'),
                    ],
                  ),
                  // Constants.spaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15),
                    child: Text(
                      'lbl_allergies'.tr,
                      style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#161B46'),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 15),
                    child: Text(
                      user.allergies!.tr,
                      style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#6E768D'),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  weightHeightBlood(String value, String unit, String measure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              value.tr + " ",
              style: AppStyle.poppinsTextStyle(
                  color: Constants.fromHex('#0064A7'),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            Text(
              unit,
              style: AppStyle.poppinsTextStyle(
                  color: Constants.fromHex('#0064A7'),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(measure,
            style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#34405E'),
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
