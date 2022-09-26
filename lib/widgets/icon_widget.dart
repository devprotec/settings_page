import 'package:settings_page/util/exports.dart';

class ImageWidget extends StatelessWidget {
  final 
  String imageFile;


  const ImageWidget({Key? key, required this.imageFile, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Constants.insideIconCircleColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: Image.asset(imageFile, height: 24, width: 24,)),
    );
  }
}
