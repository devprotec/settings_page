import 'package:mhc_customer/util/exports.dart';

class BloodDesign extends GetView<OnBoardingController> {
  final Map blood;
  const BloodDesign({Key? key, required this.blood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Obx(
      () => GestureDetector(
          onTap: () {
            controller.bloodtype.value = (blood['value'] as BLOOD_GROUP).name;
            print(controller.bloodtype.value);
          },
          child: SizedBox(
            height: Get.size.height * 0.1,
            width: Get.size.width * 0.16,
            child: CustomPaint(
              size: Size(90, (90 * 1.2413793103448276).toDouble()),
              painter: RPSCustomPainter(
                  backgroundColor: Constants.background,
                  borderWidth: controller.bloodtype.value ==
                          (blood['value'] as BLOOD_GROUP).name
                      ? 4
                      : 2,
                  border: controller.bloodtype.value ==
                          (blood['value'] as BLOOD_GROUP).name
                      ? Constants.pColor
                      : Constants.highlight),
              child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      blood['name'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
            ),
          )),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final Color backgroundColor;
  final Color border;
  final double borderWidth;

  RPSCustomPainter(
      {required this.backgroundColor,
      required this.border,
      required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1027193, size.height * 0.4141625);
    path_0.lineTo(size.width * 0.4978448, size.height * 0.01120346);
    path_0.lineTo(size.width * 0.8929707, size.height * 0.4141625);
    path_0.cubicTo(
        size.width * 1.047736,
        size.height * 0.5719958,
        size.width * 1.007664,
        size.height * 0.7928083,
        size.width * 0.8016190,
        size.height * 0.9143278);
    path_0.cubicTo(
      size.width * 0.6236379,
      size.height * 1.019297,
      size.width * 0.3720517,
      size.height * 1.019297,
      size.width * 0.1940707,
      size.height * 0.9143278,
    );
    path_0.cubicTo(
        size.width * -0.01197331,
        size.height * 0.7928083,
        size.width * -0.05204603,
        size.height * 0.5719958,
        size.width * 0.1027193,
        size.height * 0.4141625
        // size.width - 0.01197331,
        // size.height * 0.7928083,
        // size.width - 0.05204603,
        // size.height * 0.5719958,
        // size.width * 0.1027193,
        // size.height * 0.4141625,

        );
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    paint0Stroke.color = border;
    //  const Color(0xffE6E8F3).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = backgroundColor;
    // const Color(0xffF9FCFF).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree
