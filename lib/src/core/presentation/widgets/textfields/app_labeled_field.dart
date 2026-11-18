import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Generic "label on top → input below" container.
///
/// Use it to wrap any input widget (`AppTextField`, `AppSelectField`, etc.)
/// so the form looks consistent across the app.
class AppLabeledField extends StatelessWidget {
  const AppLabeledField({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.fs12w700.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppGaps.sm),
        child,
      ],
    );
  }
}
