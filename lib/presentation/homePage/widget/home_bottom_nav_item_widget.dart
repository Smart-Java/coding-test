import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavItemWidget extends StatelessWidget {
  final String iconPath;
  const HomeBottomNavItemWidget({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
