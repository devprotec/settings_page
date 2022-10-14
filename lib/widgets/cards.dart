import '../util/exports.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class CustomCard extends StatelessWidget {
  final Color? borderColor;
  final Widget widget;
  const CustomCard({Key? key, required this.widget, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  PhysicalModel(
        //   elevation: 5,
        //   borderRadius: BorderRadius.circular(16),
        //   color: Constants.pColor.withOpacity(0.1),
        //   shadowColor: Constants.pColor.withOpacity(0.1),
        //   child:
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.all(5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 0.3,
              )
            : const Border.fromBorderSide(
                BorderSide.none,
              ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0XFFE6E8F3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
          // BoxShadow(
          //   color: Color(0XFFE6E8F3),
          //   spreadRadius: 0.01,
          //   blurRadius: 1,
          //   offset: Offset(-0, -0), // changes position of shadow
          // ),
        ],
      ),
      child: widget,
      // ),
    );
  }
}
