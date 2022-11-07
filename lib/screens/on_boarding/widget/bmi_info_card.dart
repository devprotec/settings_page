import 'package:mhc_customer/util/exports.dart';

class BMIinfoCard extends StatelessWidget {
  const BMIinfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GlobalController());
    return PhysicalModel(
      elevation: 5,
      color: Constants.pColor.withOpacity(0.1),
      shadowColor: Constants.pColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: ListTile(
          leading: Icon(
            Icons.pie_chart,
            color: Constants.pColor,
          ),
          title: Text('bmi'.tr),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
