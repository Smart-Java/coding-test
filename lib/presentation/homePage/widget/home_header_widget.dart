import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/home/png/profile_pic.png'),
            ),
          ),
        ),
        const AppSpacerWidget(
          width: 10.0,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey, Jacobs',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              'Welcome back',
              style: TextStyle(
                color: AppColors.greyColor,
              ),
            )
          ],
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: SvgPicture.asset('assets/home/svg/notification.svg'),
          ),
        ),
      ],
    );
  }
}
