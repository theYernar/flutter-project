import 'package:flutter/material.dart';
import 'package:project/src/core/theme/resources.dart';

final class AppToaster {
  const AppToaster._();

  static OverlayEntry? _currentEntry;

  /// Success
  static void showSuccess(BuildContext context, {required String message}) {
    _showToast(context, message, Icons.check_rounded, AppColors.ratingGreen);
  }

  /// Error toast message
  static void showError(BuildContext context, {required String message}) {
    _showToast(context, message, Icons.error_rounded, AppColors.error);
  }

  ///
  /// Show toast message
  ///
  static void _showToast(
    BuildContext context,
    String message,
    IconData icon,
    Color color,
  ) {
    if (_currentEntry != null && _currentEntry!.mounted) {
      _currentEntry!.remove();
      _currentEntry = null;
    }

    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: _AnimatedToastWidget(
              onDismiss: () {
                if (entry.mounted) {
                  entry.remove();
                  if (_currentEntry == entry) _currentEntry = null;
                }
              },
              child: GestureDetector(
                onTap: () {
                  if (entry.mounted) {
                    entry.remove();
                    if (_currentEntry == entry) _currentEntry = null;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.disabledFill,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 8),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: color),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          message,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body14Medium.copyWith(
                            color: AppColors.bgPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    _currentEntry = entry;
    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 3), () {
      if (entry.mounted) {
        entry.remove();

        if (_currentEntry == entry) {
          _currentEntry = null;
        }
      }
    });
  }
}

class _AnimatedToastWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismiss;

  const _AnimatedToastWidget({required this.child, required this.onDismiss});

  @override
  State<_AnimatedToastWidget> createState() => _AnimatedToastWidgetState();
}

class _AnimatedToastWidgetState extends State<_AnimatedToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () => _hide());
  }

  Future<void> _hide() async {
    if (mounted) {
      await _controller.reverse();
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
