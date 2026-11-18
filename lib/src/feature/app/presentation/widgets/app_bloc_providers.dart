import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/src/core/utils/extensions/context_extension.dart';
import 'package:flutter_project/src/feature/app/bloc/app_bloc.dart';

/// A wrapper widget that provides all global BLoCs/Cubits to the application.
/// Add new global providers here to keep [App] widget clean.
class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(authRepository: context.repository.authRepository),
        ),
        // TODO: Add more global BlocProviders here
      ],
      child: child,
    );
  }
}
