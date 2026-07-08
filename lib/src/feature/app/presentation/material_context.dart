import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/core/constant/localization/localization.dart';
import 'package:project/src/core/theme/resources.dart';
import 'package:project/src/feature/app/bloc/app_bloc.dart';
import 'package:project/src/feature/app/presentation/widgets/app_router_builder.dart';
import 'package:project/src/feature/app/router/app_router.dart';

/// Entry point to the MaterialApp.router with theme, locales and routing.
class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRouterBuilder(
      createRouter: (context) {
        return AppRouter();
      },
      builder: (_, routerConfig, router) => BlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) => current is AppUnauthenticated,
        listener: (_, _) {
          if (router.current.name != LauncherRoute.name) {
            router.replaceAll([const LauncherRoute()]);
          }
        },
        child: MaterialApp.router(
          title: 'Project',
          locale: const Locale('ru'),
          onGenerateTitle: (context) => 'Project',
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          localizationsDelegates: Localization.localizationDelegates,
          supportedLocales: Localization.supportedLocales,
          builder: (context, child) {
            final currentChild = GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: child ?? const SizedBox.shrink(),
            );

            return currentChild;
          },
        ),
      ),
    );
  }
}
