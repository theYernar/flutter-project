import 'package:flutter/material.dart';
import 'package:project/src/core/theme/resources.dart';

/// 24×24 rounded checkbox styled for dark theme.
///
/// Unchecked: transparent with [AppColors.textSecondary] border.
/// Checked: filled with [AppColors.accentYellow] and a black tick.
class AppCheck extends StatelessWidget {
  const AppCheck({required this.value, required this.onChanged, super.key});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: AppSizes.checkbox,
        height: AppSizes.checkbox,
        decoration: BoxDecoration(
          color: value ? AppColors.accentYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.checkbox),
          border: Border.all(
            color: value ? AppColors.accentYellow : AppColors.textSecondary,
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check_rounded,
                size: 16,
                color: Color(0xFF1A1A1A),
              )
            : null,
      ),
    );
  }
}
