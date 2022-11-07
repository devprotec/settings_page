import 'package:settings_page/util/exports.dart';

class Bubble extends GetView<OnBoardingController> {
  final String text;
  final String image;
  final WELLNESS_GOALS value;

  const Bubble(
      {Key? key, required this.text, required this.value, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return GestureDetector(
      onTap: () => controller.addGoal(value.name),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
            ),
          ),
          child: Stack(
            children: [
              Obx(
                () => Opacity(
                  opacity: controller.goals.contains(value.name) ? 1 : 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Constants.pColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0, left: 5, right: 5),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
