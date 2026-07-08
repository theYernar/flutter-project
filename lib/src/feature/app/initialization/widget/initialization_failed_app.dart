import 'package:flutter/material.dart';
import 'package:project/src/core/theme/resources.dart';

/// Shown when bootstrapping fails. Surfaces the error and offers a retry.
class InitializationFailedApp extends StatefulWidget {
  const InitializationFailedApp({
    required this.error,
    required this.stackTrace,
    this.onRetryInitialization,
    super.key,
  });

  final Object error;
  final StackTrace stackTrace;
  final Future<void> Function()? onRetryInitialization;

  @override
  State<InitializationFailedApp> createState() =>
      _InitializationFailedAppState();
}

class _InitializationFailedAppState extends State<InitializationFailedApp> {
  final _inProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retry() async {
    _inProgress.value = true;
    try {
      await widget.onRetryInitialization?.call();
    } finally {
      if (mounted) _inProgress.value = false;
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    color: AppColors.mainColor,
    home: ValueListenableBuilder<bool>(
      valueListenable: _inProgress,
      builder: (context, inProgress, _) {
        if (inProgress) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Initialization failed',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.greyText),
                  ),
                  const SizedBox(height: 24),
                  if (widget.onRetryInitialization != null)
                    ElevatedButton(
                      onPressed: _retry,
                      child: const Text('Retry'),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
