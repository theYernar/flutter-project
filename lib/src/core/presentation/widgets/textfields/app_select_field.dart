import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Read-only field that opens a picker (bottom sheet) on tap.
///
/// Displays [value] in [AppTextStyles.inputText] or [placeholder] in a muted
/// hint style, with a trailing chevron-down icon.
class AppSelectField extends StatelessWidget {
  const AppSelectField({
    required this.value,
    required this.onTap,
    this.placeholder,
    super.key,
  });

  final String? value;
  final String? placeholder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return Material(
      color: AppColors.surface1,
      borderRadius: BorderRadius.circular(AppRadius.input),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  hasValue ? value! : (placeholder ?? ''),
                  style: hasValue
                      ? AppTextStyles.inputText
                      : AppTextStyles.inputText.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textSecondary,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
