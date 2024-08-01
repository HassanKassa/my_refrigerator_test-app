import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/notifications.svg',
      width: 50,
      height: 50,
    );
  }
}
