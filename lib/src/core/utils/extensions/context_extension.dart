import 'package:flutter/material.dart';
import 'package:project/src/core/constant/localization/localization.dart';
import 'package:project/src/core/constant/localization/translations/app_localizations.dart';
import 'package:project/src/core/containers/repository_storage.dart';
import 'package:project/src/core/presentation/scopes/repository_scope.dart';
import 'package:project/src/feature/app/initialization/model/dependencies_container.dart';
import 'package:project/src/feature/app/initialization/widget/dependencies_scope.dart';

extension ContextExtension on BuildContext {
  T? inhMaybeOf<T extends InheritedWidget>({bool listen = true}) => listen
      ? dependOnInheritedWidgetOfExactType<T>()
      : getInheritedWidgetOfExactType<T>();

  T inhOf<T extends InheritedWidget>({bool listen = true}) =>
      inhMaybeOf<T>(listen: listen) ??
      (throw ArgumentError(
        'Out of scope, not found inherited widget a $T',
        'out_of_scope',
      ));

  T? maybeInheritFrom<A extends Object, T extends InheritedModel<A>>({
    A? aspect,
  }) => InheritedModel.inheritFrom<T>(this, aspect: aspect);

  T inheritFrom<A extends Object, T extends InheritedModel<A>>({A? aspect}) =>
      maybeInheritFrom(aspect: aspect) ??
      (throw ArgumentError(
        'Out of scope, not found inherited model a $T',
        'out_of_scope',
      ));

  DependenciesContainer get dependencies => DependenciesScope.of(this);

  IRepositoryStorage get repository => RepositoryScope.of(this);

  AppLocalizations get localized => Localization.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  TargetPlatform get platform => theme.platform;
}
