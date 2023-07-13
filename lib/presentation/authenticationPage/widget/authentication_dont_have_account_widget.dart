import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class AuthenticationDontHaveAccountWidget extends StatelessWidget {
  const AuthenticationDontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?',
          style: TextStyle(color: AppColors.greyColor),
        ),
        const AppSpacerWidget(
          width: 1.0,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign up',
            style: TextStyle(color: AppColors.mainGoldColor),
          ),
        ),
      ],
    );
  }
}
