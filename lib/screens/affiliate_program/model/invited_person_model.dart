class InvitedPersonModel {
  final String name;
  final String imagePath;
  final bool isDone;

  InvitedPersonModel(
      {required this.name, required this.imagePath, required this.isDone});
}

final marvin = InvitedPersonModel(
    name: "marvin", imagePath: "assets/images/img_avatar.png", isDone: true);
final simmon = InvitedPersonModel(
    name: "Simmon",
    imagePath: "assets/images/img_avatar_56X56.png",
    isDone: true);
final lane = InvitedPersonModel(
    name: "lane", imagePath: "assets/images/img_avatar_1.png", isDone: false);
final jacob = InvitedPersonModel(
    name: "Jacob", imagePath: "assets/images/img_avatar_2.png", isDone: false);
final samuel = InvitedPersonModel(
    name: "Samuel", imagePath: "assets/images/img_avatar_3.png", isDone: false);

final invitedPersons = <InvitedPersonModel>[
  marvin,
  simmon,
  lane,
  jacob,
  samuel
];
