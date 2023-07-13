import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appRouterHandler/app_router.dart';
import 'package:login_system/infrastructure/config/appTheme/app_theme.dart';

final _appRouter = AppRouter();

class LoginSystemApp extends StatelessWidget {
  const LoginSystemApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.androidDay(context: context),
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.config(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
