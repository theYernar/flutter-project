import 'package:flutter/material.dart';
import 'package:project/src/core/constant/localization/localization.dart';
import 'package:project/src/core/constant/localization/translations/app_localizations.dart';
import 'package:project/src/core/containers/repository_storage.dart';
import 'package:project/src/core/presentation/scopes/repository_scope.dart';
import 'package:project/src/feature/app/initialization/model/dependencies_container.dart';
import 'package:project/src/feature/app/initialization/widget/dependencies_scope.dart';

extension ContextExtension on BuildContext {
  T? inhMaybeOf<T extends InheritedWidget>({bool listen = true}) =>
      listen ? dependOnInheritedWidgetOfExactType<T>() : getInheritedWidgetOfExactType<T>();

  T inhOf<T extends InheritedWidget>({bool listen = true}) =>
      inhMaybeOf<T>(listen: listen) ??
      (throw ArgumentError('Out of scope, not found inherited widget a $T', 'out_of_scope'));

  T? maybeInheritFrom<A extends Object, T extends InheritedModel<A>>({A? aspect}) =>
      InheritedModel.inheritFrom<T>(this, aspect: aspect);

  T inheritFrom<A extends Object, T extends InheritedModel<A>>({A? aspect}) =>
      maybeInheritFrom(aspect: aspect) ??
      (throw ArgumentError('Out of scope, not found inherited model a $T', 'out_of_scope'));

  DependenciesContainer get dependencies => DependenciesScope.of(this);

  IRepositoryStorage get repository => RepositoryScope.of(this);

  AppLocalizations get localized => Localization.of(this);

  // --- Screen & Media Query ---
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  double get keyboardHeight => viewInsets.bottom;
  bool get isKeyboardOpen => keyboardHeight > 0;
  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  // --- Theme & Colors ---
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isLightMode => theme.brightness == Brightness.light;

  // --- Platform ---
  TargetPlatform get platform => theme.platform;
  bool get isIOS => platform == TargetPlatform.iOS;
  bool get isAndroid => platform == TargetPlatform.android;

  // --- Navigation ---
  NavigatorState get navigator => Navigator.of(this);
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);
  bool canPop() => Navigator.of(this).canPop();

  // --- Scaffold Messenger ---
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(SnackBar snackBar) =>
      scaffoldMessenger.showSnackBar(snackBar);
  void hideCurrentSnackBar() => scaffoldMessenger.hideCurrentSnackBar();

  // --- Focus ---
  FocusScopeNode get focusScope => FocusScope.of(this);
  void unfocus() => focusScope.unfocus();
}
