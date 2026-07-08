import 'package:auto_route/auto_route.dart';

import 'package:project/src/feature/app/presentation/pages/launcher_page.dart';
import 'package:project/src/feature/app/presentation/pages/main_page.dart';
import 'package:project/src/feature/auth/ui/pages/login_page.dart';
import 'package:project/src/feature/home/ui/pages/home_page.dart';
import 'package:project/src/feature/profile/ui/pages/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes {
    return [
      ///
      /// Launcher
      ///
      AutoRoute(
        page: LauncherRoute.page,
        initial: true,
        children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: ProfileRoute.page),
        ],
      ),

      ///
      /// Auth
      ///
      AutoRoute(page: LoginRoute.page),
    ];
  }
}
