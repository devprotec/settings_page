import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double? size;
  const UserAvatar({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 90,
      width: size ?? 80,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/active.png',
            ),
            fit: BoxFit.contain,
          )),
    );
  }
}
