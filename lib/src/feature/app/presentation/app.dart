import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/src/core/constant/config.dart';
import 'package:flutter_project/src/core/containers/repository_storage.dart';
import 'package:flutter_project/src/core/presentation/scopes/repository_scope.dart';
import 'package:flutter_project/src/feature/app/bloc/app_restart_bloc.dart';
import 'package:flutter_project/src/feature/app/initialization/logic/composition_root.dart';
import 'package:flutter_project/src/feature/app/initialization/widget/dependencies_scope.dart';
import 'package:flutter_project/src/feature/app/presentation/widgets/app_bloc_providers.dart';
import 'package:flutter_project/src/feature/app/presentation/material_context.dart';

/// Root widget. Wires DependenciesScope → RepositoryScope → MaterialContext.
///
/// The outer `BlocConsumer<AppRestartBloc>` swaps a `UniqueKey` to rebuild the
/// whole subtree on app restart events (logout, locale change, etc.).
class App extends StatelessWidget {
  const App({required this.result, super.key});

  final CompositionResult result;

  @override
  Widget build(BuildContext context) => BlocConsumer<AppRestartBloc, AppRestartState>(
    listener: (context, state) {
      if (state is AppRestartStateError) {
        // Close repositories so they will be re-created on next mount.
        RepositoryScope.of(context).close();
      }
    },
    builder: (context, state) => KeyedSubtree(
      key: BlocProvider.of<AppRestartBloc>(context).uniqueKey,
      child: DependenciesScope(
        dependencies: result.dependencies,
        child: RepositoryScope(
          create: (context) => RepositoryStorage(
            sharedPreferences: result.dependencies.sharedPreferences,
            packageInfo: result.dependencies.packageInfo,
            apiBaseUrl: const Config().apiBaseUrl,
          ),
          child: const AppBlocProviders(child: MaterialContext()),
        ),
      ),
    ),
  );
}
