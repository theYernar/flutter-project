import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/src/core/presentation/widgets/buttons/app_primary_button.dart';
import 'package:flutter_project/src/core/theme/resources.dart';
import 'package:flutter_project/src/feature/app/bloc/app_bloc.dart';
import 'package:flutter_project/src/feature/app/presentation/pages/main_page.dart';
import 'package:flutter_project/src/feature/app/router/app_router.dart';

@RoutePage(name: 'LauncherRoute')
class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();

    context.read<AppBloc>().add(const AppEvent.started());
  }

  void _resetToLauncherIfNeeded() {
    final rootRouter = context.router.root;
    if (rootRouter.current.name != LauncherRoute.name) {
      rootRouter.replaceAll([const LauncherRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppUnauthenticated) {
          _resetToLauncherIfNeeded();
        }
      },
      builder: (context, state) => switch (state) {
        AppAuthenticated() => const MainPage(),
        AppUnauthenticated() => const MainPage(),
        AppFailure(:final message) => _LauncherFailure(message: message),
        AppLoading() => const _LauncherLoading(),
      },
    );
  }
}

class _LauncherLoading extends StatelessWidget {
  const _LauncherLoading();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.mainColor),
      ),
    );
  }
}

class _LauncherFailure extends StatelessWidget {
  const _LauncherFailure({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16Regular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppGaps.lg),
              AppPrimaryButton(
                label: 'context.localized.commonRetry',
                onPressed: () =>
                    context.read<AppBloc>().add(const AppEvent.started()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
