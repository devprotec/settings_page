import 'package:settings_page/util/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const Login());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-1, 0.35),
          child: RotatedBox(
            quarterTurns: 1,
            child: CustomPaint(
              painter: TrianglePainter(
                strokeColor: const Color(0xff00AEEF),
                strokeWidth: 10,
                paintingStyle: PaintingStyle.fill,
              ),
              child: SizedBox(
                height: 50,
                width: size.width * 0.2,
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(1, 0.5),
          child: RotatedBox(
            quarterTurns: 3,
            child: CustomPaint(
              painter: ShapePainter(
                strokeColor: Colors.white.withOpacity(0.4),
                strokeWidth: 10,
                paintingStyle: PaintingStyle.fill,
              ),
              child: SizedBox(
                height: 180,
                width: size.width * 1,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: const Color(0xff00AEEF).withOpacity(0.9),
              strokeWidth: 10,
              paintingStyle: PaintingStyle.fill,
            ),
            child: SizedBox(
              height: 150,
              width: size.width * 0.75,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding:
                EdgeInsets.only(top: size.height * 0.07, left: 20, right: 20),
            height: size.height * 0.45,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Vector.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Constants.spaceMedium,
              Image.asset(Constants.logo),
              Constants.space,
              TitleText('healthier'.tr),
              Constants.space,
              TitleText('stronger'.tr),
              Constants.space,
              TitleText('longer'.tr),
            ]),
          ),
        ),
        // Image.asset(
        //   'assets/images/SplashScreen.png',
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.contain,
        // )
      ]),
    );
  }
}
