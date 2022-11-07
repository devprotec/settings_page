import 'package:settings_page/util/exports.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const CustomAppBar({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
            opacity: 0,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close))),
        TitleText(text),
        IconButton(onPressed: function, icon: const Icon(Icons.close))
      ],
    );
  }
}

class IconAppBar extends StatelessWidget {
  final String text;
  final Widget icon;
  const IconAppBar({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [TitleText(text), icon],
    );
  }
}

class BackAppBar extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color? color;
  const BackAppBar(
      {Key? key, required this.text, required this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: color ?? Colors.white,
            size: 30,
          ),
        ),
        TitleText(
          text,
          color: color ?? Colors.white,
        ),
        icon,
      ],
    );
  }
}
