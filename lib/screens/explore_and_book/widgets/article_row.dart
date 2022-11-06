

import '../../../util/exports.dart';

class ArticleRow extends StatelessWidget {
  final String text;
  const ArticleRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.tr,
          style: AppStyle.poppinsTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Constants.fromHex('#161B46'),
          ),
        ),
        Text(
          'lbl_more'.tr,
          style: AppStyle.poppinsTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Constants.fromHex('#00ACE9'),
          ),
        ),
      ],
    );
  }
}