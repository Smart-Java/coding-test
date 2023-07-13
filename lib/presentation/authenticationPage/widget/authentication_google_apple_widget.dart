import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class AuthenticationGoogleAppleWidget extends StatelessWidget {
  const AuthenticationGoogleAppleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/login/svg/google.svg'),
        const AppSpacerWidget(
          width: 30.0,
        ),
        SvgPicture.asset('assets/login/svg/apple.svg'),
      ],
    );
  }
}
