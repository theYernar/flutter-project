import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/src/core/utils/extensions/context_extension.dart';
import 'package:flutter_project/src/feature/app/initialization/model/dependencies_container.dart';

/// Provides composed [DependenciesContainer] to the widget tree.
///
/// For widget tests subclass [TestDependenciesContainer] and override only
/// the dependencies your test touches.
class DependenciesScope extends InheritedWidget {
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final DependenciesContainer dependencies;

  static DependenciesContainer of(BuildContext context) =>
      context.inhOf<DependenciesScope>(listen: false).dependencies;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<DependenciesContainer>('dependencies', dependencies),
    );
  }

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) =>
      !identical(dependencies, oldWidget.dependencies);
}
