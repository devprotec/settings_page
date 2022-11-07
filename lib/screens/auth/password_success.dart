import 'package:settings_page/util/exports.dart';

class PasswordSuccess extends StatelessWidget {
  const PasswordSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.05),
            CustomAppBar(
              text: 'passwordchanged'.tr,
              function: () {
                Get.back();
              },
            ),
            SvgPicture.asset(
              'assets/svgs/password_success.svg',
              height: size.height * 0.4,
            ),
            // Image.asset(
            //   'assets/images/password_success.png',
            //   height: size.height * 0.5,
            // ),
            Text.rich(
              TextSpan(
                text: '',
                style: const TextStyle(
                  color: Color(0xff6E768D),
                  fontSize: 14,
                ),
                children: [
                  TextSpan(text: 'passwordsucess'.tr),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Button(
              text: 'gotologin'.tr,
              onPressed: () {
                Get.to(const Login());
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
