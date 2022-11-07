import 'package:mhc_customer/util/exports.dart';

class RoleItems extends StatelessWidget {
  final String title;
  final String description;
  final String svg;
  final String? svg2;
  final Color color;
  final Function()? onTap;
  const RoleItems(
      {Key? key,
      required this.title,
      required this.description,
      required this.color,
      required this.svg,
      required this.svg2,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        title,
                        weight: FontWeight.bold,
                        size: 14,
                        textColor: const Color(0XFF34405E),
                      ),
                      SmallText(
                        description,
                        textColor: const Color(0XFF34405E),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(
                svg,
                width: svg2 != null
                    ? MediaQuery.of(context).size.width * 0.1
                    : MediaQuery.of(context).size.width * 0.2,
              ),
              if (svg2 != null) ...[
                SvgPicture.asset(
                  svg2!,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
