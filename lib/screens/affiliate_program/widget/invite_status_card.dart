import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_style.dart';
import '../../../util/constants.dart';
import '../../../widgets/common_image_view.dart';
import '../model/invited_person_model.dart';
import 'invited_friends_avatar.dart';


class InviteStatusCard extends StatefulWidget {
  final List<InvitedPersonModel> invitedPeople;
  const InviteStatusCard({Key? key, required this.invitedPeople}) : super(key: key);

  @override
  State<InviteStatusCard> createState() => _InviteStatusCardState();
}

class _InviteStatusCardState extends State<InviteStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [boxShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            inviteNumberAndStatus(
                imagePath: "assets/svgs/timer.svg",
                numberofInvites: "24",
                status: "Pending",
                iconColor: Constants.fromHex('#E57E25')),
            Container(
              width: 1,
              color: Colors.black26,
              height: 40,
            ),
            inviteNumberAndStatus(
                iconData: Icons.people_alt,
                numberofInvites: "7",
                status: "Done",
                iconColor: Constants.fromHex('#00ACE9')),
            const Divider(
              thickness: 5,
              height: 20,
            ),
            Container(
              width: 1,
              color: Colors.black26,
              height: 40,
            ),
            inviteNumberAndStatus(
                imagePath: "assets/svgs/cash.svg",
                numberofInvites: r"$100",
                status: "Earned",
                iconColor: Constants.fromHex('#E57E25')),
          ]),
          Constants.spaceLarge,
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: widget.invitedPeople.length,
                itemBuilder: (context, index) {
                  return InvitedFriendAvatar(
                      isDone: widget.invitedPeople[index].isDone,
                      name: widget.invitedPeople[index].name,
                      imagePath: widget.invitedPeople[index].imagePath);
                }),
          )

          //ListView(),
        ],
      ),
    );
  }

  inviteNumberAndStatus(
      {String? imagePath,
      required String numberofInvites,
      required String status,
      required Color iconColor,
      IconData? iconData}) {
    return Column(
      children: [
        Row(
          children: [
            imagePath == null
                ? Icon(
                    iconData,
                    size: 14,
                    color: iconColor,
                  )
                : CommonImageView(
                    svgPath: imagePath,
                  ),
            const SizedBox(
              width: 4,
            ),
            Text(
              numberofInvites.tr,
              style: AppStyle.poppinsTextStyle(
                  color: Constants.fromHex('#0E1339'),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(status.tr,
            style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#34405E'),
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  final boxShadow = BoxShadow(
    color: Constants.fromHex('#0064a7').withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(
      0,
      2,
    ),
  );
}
