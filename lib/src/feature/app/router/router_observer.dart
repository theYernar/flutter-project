import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/utils/talker_logger_util.dart';
import 'package:talker_flutter/talker_flutter.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _log(
      'Pushed route: ${_routeName(route)}. Previous: ${_routeName(previousRoute)}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _log(
      'Popped route: ${_routeName(route)}. Previous: ${_routeName(previousRoute)}',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _log(
      'Removed route: ${_routeName(route)}. Previous: ${_routeName(previousRoute)}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _log('Replaced route: ${_routeName(oldRoute)} -> ${_routeName(newRoute)}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);
    _log(
      'Tab route visited: ${route.name}. Previous: ${previousRoute?.name ?? 'none'}',
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);
    _log(
      'Tab route re-visited: ${route.name}. Previous: ${previousRoute.name}',
    );
  }

  String _routeName(Route<dynamic>? route) {
    if (route == null) return 'none';
    return route.settings.name ?? route.runtimeType.toString();
  }

  void _log(String message) {
    TalkerLoggerUtil.talker.logCustom(_RouterLog(message));
  }
}

class _RouterLog extends TalkerLog {
  _RouterLog(super.message)
    : super(key: TalkerKey.route, title: 'route', pen: AnsiPen()..xterm(135));
}
