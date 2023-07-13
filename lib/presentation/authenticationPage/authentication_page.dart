import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/infrastructure/di/injection.dart';
import 'package:login_system/presentation/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:login_system/presentation/authenticationPage/widget/authentication_scaffold_widget.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<AuthenticationPageBloc>(),
        child: const AuthenticationScaffoldWidget(),
      ),
    );
  }
}
