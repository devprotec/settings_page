import 'package:mhc_customer/util/exports.dart';

class SettingsItems extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? color;
  final Color? iconColor;
  final IconData icon;
  final Function()? onTap;

  const SettingsItems({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.color,
    this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: onTap,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: color ?? Constants.pColor.withOpacity(0.2),
          child: Icon(
            icon,
            size: 20,
            color: iconColor ?? Constants.pColor
          ),
        ),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}
