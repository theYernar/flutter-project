import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

enum AppTextFieldVariant { regular, compact }

/// Plain filled text input that picks up styling from the theme's
/// [InputDecorationTheme]. Use it whenever you need a generic textbox without
/// the phone-number mask.
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    this.variant = AppTextFieldVariant.regular,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.obscureText = false,
    this.isPassword = false,
    this.style,
    this.hintStyle,
    this.height,
    this.fillColor,
    this.contentPadding,
    this.borderRadius,
    this.enabledBorderSide,
    this.focusedBorderSide,
    this.showFocusedBorderWhenFilled = false,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.maxLength,
    this.maxLines = 1,
    this.expands = false,
    this.counterText,
    super.key,
  });

  final TextEditingController controller;
  final AppTextFieldVariant variant;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool isPassword;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final double? height;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final BorderSide? enabledBorderSide;
  final BorderSide? focusedBorderSide;
  final bool showFocusedBorderWhenFilled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  final int? maxLines;
  final bool expands;
  final String? counterText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword || widget.obscureText;
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPassword != widget.isPassword ||
        oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.isPassword || widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, _, _) {
        final textField = TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          obscureText: _obscureText,
          maxLength: widget.maxLength,
          maxLines: widget.expands ? null : widget.maxLines,
          expands: widget.expands,
          cursorColor: AppColors.mainColor,
          style: widget.style ?? _variantStyle,
          decoration: _decoration,
        );

        final effectiveHeight = widget.height ?? _variantHeight;
        if (effectiveHeight == null) return textField;
        return SizedBox(height: effectiveHeight, child: textField);
      },
    );
  }

  InputDecoration get _decoration {
    final radius =
        widget.borderRadius ?? BorderRadius.circular(AppRadius.input);
    final effectiveFocusedBorderSide =
        widget.focusedBorderSide ?? _variantFocusedBorderSide;
    final hasBorderOverride =
        widget.borderRadius != null ||
        widget.enabledBorderSide != null ||
        effectiveFocusedBorderSide != null ||
        widget.showFocusedBorderWhenFilled;
    final hasValue = widget.controller.text.trim().isNotEmpty;
    final resolvedFocusedBorderSide =
        effectiveFocusedBorderSide ??
        (widget.showFocusedBorderWhenFilled
            ? const BorderSide(color: AppColors.mainColor)
            : BorderSide.none);
    final resolvedEnabledBorderSide =
        widget.showFocusedBorderWhenFilled && hasValue
        ? resolvedFocusedBorderSide
        : widget.enabledBorderSide ?? BorderSide.none;

    InputBorder? makeBorder(BorderSide side) => hasBorderOverride
        ? OutlineInputBorder(borderRadius: radius, borderSide: side)
        : null;

    Widget? effectiveSuffixIcon = widget.suffixIcon;
    if (widget.isPassword && effectiveSuffixIcon == null) {
      effectiveSuffixIcon = IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded, size: 24),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return InputDecoration(
      hintText: widget.hint,
      hintStyle: widget.hintStyle ?? _variantHintStyle,
      filled: _effectiveFillColor == null ? null : true,
      fillColor: _effectiveFillColor,
      contentPadding: widget.contentPadding ?? _variantContentPadding,
      counterText: widget.counterText,
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      suffixIcon: effectiveSuffixIcon,
      suffixIconConstraints: widget.suffixIconConstraints,
      border: widget.border ?? makeBorder(resolvedEnabledBorderSide),
      enabledBorder:
          widget.enabledBorder ?? makeBorder(resolvedEnabledBorderSide),
      focusedBorder:
          widget.focusedBorder ?? makeBorder(resolvedFocusedBorderSide),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? AppColors.mainColor
            : AppColors.textSecondary,
      ),
      suffixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? AppColors.mainColor
            : AppColors.textSecondary,
      ),
    );
  }

  TextStyle get _variantStyle => switch (widget.variant) {
    AppTextFieldVariant.regular => AppTextStyles.inputText,
    AppTextFieldVariant.compact => AppTextStyles.body14Regular.copyWith(
      color: AppColors.textPrimary,
      height: 18 / 14,
    ),
  };

  TextStyle? get _variantHintStyle => switch (widget.variant) {
    AppTextFieldVariant.regular => null,
    AppTextFieldVariant.compact => AppTextStyles.body14Regular.copyWith(
      color: AppColors.textSecondary,
      height: 18 / 14,
    ),
  };

  double? get _variantHeight => switch (widget.variant) {
    AppTextFieldVariant.regular => null,
    AppTextFieldVariant.compact => 48,
  };

  EdgeInsetsGeometry? get _variantContentPadding => switch (widget.variant) {
    AppTextFieldVariant.regular => null,
    AppTextFieldVariant.compact => const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 15,
    ),
  };

  Color? get _effectiveFillColor =>
      widget.fillColor ??
      switch (widget.variant) {
        AppTextFieldVariant.regular => AppColors.grey10,
        AppTextFieldVariant.compact => AppColors.grey10,
      };

  BorderSide? get _variantFocusedBorderSide => switch (widget.variant) {
    AppTextFieldVariant.regular => null,
    AppTextFieldVariant.compact => const BorderSide(color: AppColors.mainColor),
  };
}
