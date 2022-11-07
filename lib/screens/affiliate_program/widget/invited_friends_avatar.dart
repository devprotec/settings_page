import 'package:settings_page/util/exports.dart';

// ignore: must_be_immutable
class InvitedFriendAvatar extends StatelessWidget {
  final bool isDone;
  final String name;
  final String imagePath;
  const InvitedFriendAvatar(
      {Key? key,
      required this.isDone,
      required this.name,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CommonImageView(
                imagePath: imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    isDone
                        ? CommonImageView(
                            imagePath: "assets/images/img_vector_20X20.png",
                            height: 15,
                            width: 15,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 1, top: 1),
                            child: CommonImageView(
                              svgPath: "assets/svgs/timer.svg",
                              height: 13,
                              width: 13,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              name.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#161B46'),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
