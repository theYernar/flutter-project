import 'package:flutter/material.dart';
import 'package:project/src/feature/app/router/router_observer.dart';

class NavigatorObserversFactory {
  const NavigatorObserversFactory();

  List<NavigatorObserver> call() => [RouterObserver()];
}
