import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_project/src/core/presentation/widgets/textfields/app_text_field.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Filled phone-number input with `+7 (XXX) XXX-XX-XX` mask.
///
/// Caller owns the [controller]. The `onChanged` callback receives the
/// **digits-only** value (`+77001234567`) so consumers don't have to strip
/// the mask themselves.
class AppPhoneField extends StatefulWidget {
  const AppPhoneField({
    required this.controller,
    this.onChanged,
    this.hintText,
    this.variant = AppTextFieldVariant.regular,
    this.height,
    this.style,
    this.hintStyle,
    this.fillColor,
    this.contentPadding,
    this.focusedBorderSide,
    this.showFocusedBorderWhenFilled = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    super.key,
  });

  factory AppPhoneField.transfer({
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    String? hintText,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    Key? key,
  }) {
    return AppPhoneField(
      key: key,
      controller: controller,
      hintText: hintText,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      height: 56,
      style: AppTextStyles.body16Regular.copyWith(
        color: AppColors.white,
        height: 20 / 16,
      ),
      hintStyle: AppTextStyles.body16Regular.copyWith(
        color: AppColors.textSecondary,
        height: 20 / 16,
      ),
      fillColor: AppColors.grey10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      focusedBorderSide: const BorderSide(
        color: AppColors.mainColor,
        width: 1.5,
      ),
      showFocusedBorderWhenFilled: true,
      onChanged: onChanged,
    );
  }

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final AppTextFieldVariant variant;
  final double? height;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide? focusedBorderSide;
  final bool showFocusedBorderWhenFilled;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;

  static const String mask = '+7 ### ### ## ##';

  /// Strips formatting characters from a masked value, returning at most
  /// 12 digits prefixed with `+`. Used by parents that need the raw phone.
  static String unmask(String value) {
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    return digits.isEmpty ? '' : '+$digits';
  }

  @override
  State<AppPhoneField> createState() => _AppPhoneFieldState();
}

class _AppPhoneFieldState extends State<AppPhoneField> {
  late final MaskTextInputFormatter _formatter = MaskTextInputFormatter(
    mask: AppPhoneField.mask,
    filter: {'#': RegExp(r'\d')},
  );

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      variant: widget.variant,
      hint: widget.hintText ?? '+7',
      keyboardType: TextInputType.phone,
      inputFormatters: [_formatter],
      height: widget.height,
      style: widget.style,
      hintStyle: widget.hintStyle,
      fillColor: widget.fillColor,
      contentPadding: widget.contentPadding,
      focusedBorderSide: widget.focusedBorderSide,
      showFocusedBorderWhenFilled: widget.showFocusedBorderWhenFilled,
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      onChanged: (masked) {
        widget.onChanged?.call(AppPhoneField.unmask(masked));
      },
    );
  }
}
