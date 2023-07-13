import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class AuthenticationOrWidget extends StatelessWidget {
  const AuthenticationOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Divider(
            color: AppColors.bgFormColorElement,
          ),
        ),
        AppSpacerWidget(
          width: 5.0,
        ),
        Text(
          'OR',
          style: TextStyle(color: AppColors.greyColor),
        ),
        AppSpacerWidget(
          width: 5.0,
        ),
        SizedBox(
          width: 100.0,
          child: Divider(
            color: AppColors.bgFormColorElement,
          ),
        ),
      ],
    );
  }
}
