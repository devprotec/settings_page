import 'package:flutter/cupertino.dart';

import 'package:settings_page/util/exports.dart';

class UserProfile extends StatefulWidget {
  final User user;
  const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double _height = Get.height;
    double _width = Get.width;

    List<Map> detailList = [
      {
        'title': 'personal_details'.tr,
        'icon': CupertinoIcons.person,
        'onTap': () {
          Get.to(PersonalDetailsScreen(
            user: customerUser,
          ));
        },
      },
      {
        'title': 'fitness_details'.tr,
        'icon': Icons.fitness_center_rounded,
        'onTap': () {
          Get.to(() => const ProfileFitnessDetailsScreen());
        },
      },
      {
        'title': 'Address Details'.tr,
        'icon': CupertinoIcons.location_solid,
        'onTap': () {
          Get.to(() => AddressDetails());
        },
      },
      {
        'title': 'Billing Details'.tr,
        'icon': Icons.receipt_long_rounded,
        // 'icon': Icons.person_pin_circle_sharp,
        'onTap': () {
          Get.to(() => BillingDetailsScreen());
        },
      },
      {
        'title': 'Professional Details'.tr,
        'icon': Icons.school_rounded,
        'onTap': () {
          Get.to(() => CoachDetailsScreen());
        },
        // 'subtitle': 'english'.tr,
      },
      {
        'title': 'my_wishlist'.tr,
        'icon': Icons.favorite,
        'onTap': () {},
        'color': Constants.fromHex('#EFDAF7'),
        'iconColor': Constants.fromHex('#B75FDC'),
      },
      // 'subtitle': 'english'.tr,

      {
        'title': 'leaderboard'.tr,
        'icon': Icons.emoji_events,
        'onTap': () {},
        'color': Constants.fromHex('#EFDAF7'),
        'iconColor': Constants.fromHex('#B75FDC'),
      },
      {
        'title': 'invite_friends'.tr,
        'icon': Icons.people_alt,
        'onTap': () {
          Get.to(const InviteFriends());
        },
        'color': Constants.fromHex('#EFDAF7'),
        'iconColor': Constants.fromHex('#B75FDC'),
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/image.png",
            fit: BoxFit.fitWidth,
            width: _width,
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Constants.spaceLarge,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: IconAppBar(
                    text: 'Profile'.tr,
                    icon: IconButton(
                      onPressed: () {
                        Get.to(MainSettingsPage());
                      },
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Constants.textColor2,
                      ),
                    ),
                  ),
                ),
                // Constants.spaceSmall,
                const UserAvatar(),
                Constants.spaceSmall,
                const Center(child: TitleText('Hannah Burnell', fontSize: 18)),
                Constants.spaceSmall,
                widget.user.roleLabel == RoleLabel.PROFESSIONAL
                    ? Center(
                        child: TitleBadge(
                          icon: Icons.sports_basketball_rounded,
                          text: 'Coach'.tr,
                          color: Colors.deepOrangeAccent,
                        ),
                      )
                    : const SizedBox.shrink(),
                Constants.spaceMedium,
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomCard(
                          widget: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const IconBadge(
                                    color: Colors.blue,
                                    icon: Icons.workspace_premium_rounded,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Achievement'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'SEE ALL'.tr,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ))
                                ]),
                            Constants.spaceMedium,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: MetricStar(
                                    icon: CupertinoIcons.heart,
                                    color: Color(0XFFE6E8F3),
                                    text: 'First cardio workout',
                                  ),
                                ),
                                Expanded(
                                  child: MetricStar(
                                    icon: CupertinoIcons.flame_fill,
                                    color: widget.user.roleLabel ==
                                            RoleLabel.PROFESSIONAL
                                        ? Colors.deepOrange
                                        : const Color(0XFFE6E8F3),
                                    text: '300 kcal  burned    ',
                                  ),
                                ),
                                Expanded(
                                  child: MetricStar(
                                    icon: Icons.coffee_rounded,
                                    color: Color(0XFFE6E8F3),
                                    text: '8 cups water per day',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    ),
                    Constants.spaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const WalletPage());
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                //color: const Color(0XFF0095E9),
                                gradient:
                                    widget.user.roleLabel == RoleLabel.CUSTOMER
                                        ? LinearGradient(colors: [
                                            Constants.fromHex('#F79F1B'),
                                            Constants.fromHex('#E46E2C'),
                                          ])
                                        : LinearGradient(colors: [
                                            Constants.fromHex('#00ACE9'),
                                            Constants.fromHex('#0095E9'),
                                          ]),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0XFFE6E8F3),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                      backgroundColor: widget.user.roleLabel ==
                                              RoleLabel.CUSTOMER
                                          ? Constants.fromHex('#E57E25')
                                          : Constants.fromHex('#0064A7'),
                                      radius: 20,
                                      child: const Icon(
                                        Icons.account_balance_wallet_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'my_balance'.tr,
                                          style: const TextStyle(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "\$ " +
                                              widget.user.balance.toString().tr,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      widget.user.roleLabel ==
                                              RoleLabel.CUSTOMER
                                          ? Positioned.fill(
                                              top: 35,
                                              left: 240,
                                              child: Text(
                                                "top_up".tr.toUpperCase(),
                                                style:
                                                    AppStyle.poppinsTextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned.fill(
                              top: 10,
                              left: 150,
                              child: CommonImageView(
                                svgPath: 'assets/svgs/vector22.svg',
                                color: Colors.white54,
                              ),
                            ),
                            Positioned.fill(
                              top: 25,
                              left: 150,
                              child: CommonImageView(
                                svgPath: 'assets/svgs/vector23.svg',
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Constants.spaceMedium,
                    ...detailList
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SettingsItems(
                                subtitle: e.containsKey('subtitle')
                                    ? e['subtitle']
                                    : null,
                                onTap: e['onTap'],
                                color: e['color'],
                                iconColor: e['iconColor'],
                                icon: e['icon'],
                                title: e['title'],
                                key: Key(e['title']),
                              ),
                            ))
                        .toList(),
                    Constants.spaceMedium,
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

User customerUser = User(
    username: "Hannah Burnell",
    roleLabel: RoleLabel.CUSTOMER,
    dataOfBirth: DateTime.now(),
    balance: 0.00,
    gender: Genders.F,
    phonenumber: '+233 446 545 895',
    email: 'customer.user@example.com',
    height: 160,
    weight: 60,
    bloodType: 'A',
    allergies: "cow_milk");

User professionalUser = User(
    username: "Hannah Burnell",
    roleLabel: RoleLabel.PROFESSIONAL,
    dataOfBirth: DateTime.now(),
    balance: 10000.50,
    gender: Genders.F,
    phonenumber: '+233 446 545 895',
    email: 'professional.user@example.com',
    height: 160,
    weight: 60,
    bloodType: 'A',
    allergies: "cow_milk");
