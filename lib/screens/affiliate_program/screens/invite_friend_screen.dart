import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../util/constants.dart';
import '../../../widgets/common_image_view.dart';
import '../model/invited_person_model.dart';
import '../widget/bottomsheets.dart';
import '../widget/invite_status_card.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: IconButton(
                  color: Constants.fromHex("#6E768D"),
                  iconSize: 24,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: CommonImageView(
              svgPath: "assets/svgs/invite_friends.svg",
            )),
            Constants.spaceSmall,
            Text(
              'invite_a_friend'.tr,
              style: TextStyle(
                  color: Constants.fromHex('#161B46'),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            Text(
              'get_a_bonus'.tr,
              style: TextStyle(
                  color: Constants.fromHex('#161B46'),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            Constants.spaceMedium,
            Text(
              'get_bonus_for'.tr,
              style: TextStyle(
                  color: Constants.fromHex('#34405E'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
            Constants.spaceMedium,
            GestureDetector(
              onTap: () {
                Get.bottomSheet(const ShareLinkBottomSheet());
              },
              child: RowWithinContainer(
                text: "share_link",
                imagePath: "assets/svgs/share_icon.svg",
                containerColor: Constants.fromHex('#CDF1FF'),
                textColor: Constants.fromHex('#0064A7'),
              ),
            ),
            Constants.spaceMedium,
            GestureDetector(
              onTap: () {
                Share.share('myhealthcop.com');
              },
              child: RowWithinContainer(
                text: 'invite_friend',
                imagePath: "assets/svgs/add_person.svg",
                containerColor: Constants.fromHex('#00ACE9'),
              ),
            ),
            Constants.spaceMedium,
            SizedBox(
                height: 175,
                child: InviteStatusCard(invitedPeople: invitedPersons)),
          ],
        )),
      ),
    );
  }
}

class RowWithinContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color containerColor;
  final Color? textColor;
  const RowWithinContainer(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.containerColor,
      this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CommonImageView(svgPath: imagePath, height: 24, width: 24),
          const SizedBox(
            width: 15,
          ),
          Text(text.tr.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,),),
        ],),);
  }
}
