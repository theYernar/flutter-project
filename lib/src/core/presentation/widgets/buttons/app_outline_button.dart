import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/presentation/widgets/buttons/app_ink_button.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    required this.label,
    required this.onPressed,
    this.height = 56,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 24),
    this.borderWidth = 1,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry contentPadding;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    final resolvedTextColor = textColor ?? AppColors.textPrimary;
    final resolvedBorderColor =
        borderColor ?? AppColors.textPrimary.withValues(alpha: 0.78);
    final labelStyle = (textStyle ?? AppTextStyles.body14Semibold).copyWith(
      color: isEnabled ? resolvedTextColor : AppColors.disabledText,
    );

    return AppInkButton(
      height: height,
      padding: contentPadding,
      shape: StadiumBorder(
        side: BorderSide(
          color: isEnabled ? resolvedBorderColor : AppColors.disabledText,
          width: borderWidth,
        ),
      ),
      onTap: isEnabled ? onPressed : null,
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: labelStyle,
      ),
    );
  }
}
