import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/title_text.dart';

class TitleBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const TitleBadge(
      {Key? key, required this.icon, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          TitleText(
            text,
            fontSize: 13,
            color: color,
          )
        ],
      ),
    );
  }
}

class TextBadge extends StatelessWidget {
  final String text;
  final Color color;
  const TextBadge({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleText(
            text,
            fontSize: 12,
            color: color,
          )
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  const IconBadge({Key? key, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color.withOpacity(0.3), shape: BoxShape.circle),
      child: Icon(icon, size: 18, color: color),
    );
  }
}

class MetricStar extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  const MetricStar(
      {Key? key, required this.icon, this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
              "assets/svgs/metric_star.svg",
              color: color?.withOpacity(0.5),
            ),
            Positioned(
                left: 15,
                top: 15,
                child: Icon(
                  icon,
                  color: color,
                )),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
        )
      ],
    );
  }
}
