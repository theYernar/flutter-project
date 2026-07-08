import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project/src/core/presentation/widgets/layout/main_bottom_bar.dart';
import 'package:project/src/core/theme/resources.dart';
import 'package:project/src/feature/app/router/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    // context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: AppColors.bgPrimary,
          extendBody: true,
          body: child,
          bottomNavigationBar: MainBottomBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
