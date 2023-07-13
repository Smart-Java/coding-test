import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/presentation/authenticationPage/widget/authentication_login_widget.dart';

class AuthenticationScaffoldWidget extends StatefulWidget {
  const AuthenticationScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationScaffoldWidget> createState() =>
      _AuthenticationScaffoldWidgetState();
}

class _AuthenticationScaffoldWidgetState
    extends State<AuthenticationScaffoldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: AuthenticationLoginWidget(),
    );
  }
}
