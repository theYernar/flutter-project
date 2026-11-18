import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

enum AppPrimaryButtonStyle { primary, secondary }

/// Primary CTA. Pill-shaped, full-width, fixed height [AppSizes.buttonHeight].
///
/// `onPressed == null` renders the disabled state (grey fill + grey label).
/// Passing `isLoading: true` swaps the label for an activity indicator and
/// also disables the tap.
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.label,
    required this.onPressed,
    this.style = AppPrimaryButtonStyle.primary,
    this.isLoading = false,
    this.isCenter = false,
    this.height,
    this.textStyle,
    this.enabledFillColor,
    this.disabledFillColor,
    this.enabledTextColor,
    this.disabledTextColor,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.contentPadding,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppPrimaryButtonStyle style;
  final bool isLoading;
  final bool isCenter;
  final double? height;
  final TextStyle? textStyle;
  final Color? enabledFillColor;
  final Color? disabledFillColor;
  final Color? enabledTextColor;
  final Color? disabledTextColor;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final canTap = onPressed != null && !isLoading;
    final isVisuallyEnabled = onPressed != null || isLoading;
    final spec = _AppPrimaryButtonSpec.of(style);
    final resolvedHeight = height ?? spec.height;
    final fill = isVisuallyEnabled
        ? enabledFillColor ?? spec.enabledFill
        : disabledFillColor ?? spec.disabledFill;
    final labelColor = isVisuallyEnabled
        ? enabledTextColor ?? spec.enabledText
        : disabledTextColor ?? spec.disabledText;
    final labelStyle = (textStyle ?? spec.textStyle).copyWith(
      color: labelColor,
    );

    return SizedBox(
      width: double.infinity,
      height: resolvedHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: fill,
          foregroundColor: labelColor,
          disabledBackgroundColor: disabledFillColor ?? spec.disabledFill,
          disabledForegroundColor: disabledTextColor ?? spec.disabledText,
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(spec.radius),
          ),
        ),
        onPressed: canTap ? onPressed : null,
        child: isLoading
            ? CupertinoActivityIndicator(color: labelColor)
            : _ButtonContent(
                label: label,
                style: labelStyle,
                leading: leading,
                trailing: trailing,
                padding: contentPadding ?? spec.contentPadding,
                isCenter: isCenter,
              ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.style,
    required this.padding,
    this.leading,
    this.trailing,
    required this.isCenter,
  });

  final String label;
  final TextStyle style;
  final EdgeInsetsGeometry padding;
  final Widget? leading;
  final Widget? trailing;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    final labelWidget = Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
    if (leading == null && trailing == null) return Center(child: labelWidget);

    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: isCenter ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: AppGaps.sm)],
          Flexible(child: labelWidget),
          if (trailing != null) ...[
            const Spacer(),
            DefaultTextStyle(style: style, child: trailing!),
          ],
        ],
      ),
    );
  }
}

class _AppPrimaryButtonSpec {
  const _AppPrimaryButtonSpec({
    required this.height,
    required this.radius,
    required this.enabledFill,
    required this.disabledFill,
    required this.enabledText,
    required this.disabledText,
    required this.textStyle,
    required this.contentPadding,
  });

  final double height;
  final double radius;
  final Color enabledFill;
  final Color disabledFill;
  final Color enabledText;
  final Color disabledText;
  final TextStyle textStyle;
  final EdgeInsetsGeometry contentPadding;

  factory _AppPrimaryButtonSpec.of(AppPrimaryButtonStyle style) {
    return switch (style) {
      AppPrimaryButtonStyle.primary => _AppPrimaryButtonSpec(
        height: AppSizes.buttonHeight,
        radius: 16,
        enabledFill: AppColors.mainColor,
        disabledFill: const Color.fromARGB(50, 232, 96, 42),
        enabledText: Colors.white,
        disabledText: AppColors.disabledText,
        textStyle: AppTextStyles.fs18w700.copyWith(height: 0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      AppPrimaryButtonStyle.secondary => _AppPrimaryButtonSpec(
        height: AppSizes.buttonHeight,
        radius: 16,
        enabledFill: AppColors.grey13,
        disabledFill: AppColors.disabledFill,
        enabledText: AppColors.mainColor,
        disabledText: AppColors.disabledText,
        textStyle: AppTextStyles.fs18w700.copyWith(height: 0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    };
  }
}
