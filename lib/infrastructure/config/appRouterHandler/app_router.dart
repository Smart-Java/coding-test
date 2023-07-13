import 'package:auto_route/auto_route.dart';
import 'package:login_system/presentation/authenticationPage/authentication_page.dart';
import 'package:login_system/presentation/homePage/home_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthenticationRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
