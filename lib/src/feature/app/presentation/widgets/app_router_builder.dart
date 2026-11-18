import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/feature/app/router/navigator_observers_factory.dart';

typedef CreateRouter = RootStackRouter Function(BuildContext context);
typedef RouterWidgetBuilder =
    Widget Function(
      BuildContext context,
      RouterConfig<UrlState> routerConfig,
      RootStackRouter router,
    );

class AppRouterBuilder extends StatefulWidget {
  const AppRouterBuilder({
    required this.createRouter,
    required this.builder,
    super.key,
  });

  final CreateRouter createRouter;
  final RouterWidgetBuilder builder;

  @override
  State<AppRouterBuilder> createState() => _AppRouterBuilderState();
}

class _AppRouterBuilderState extends State<AppRouterBuilder> {
  late final RootStackRouter _router = widget.createRouter(context);

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    _router.config(navigatorObservers: const NavigatorObserversFactory().call),
    _router,
  );
}
