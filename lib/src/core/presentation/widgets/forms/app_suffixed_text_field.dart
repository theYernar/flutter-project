import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/src/core/presentation/widgets/textfields/app_text_field.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Filled numeric input with a trailing static suffix (e.g. "км").
///
/// Used on the mileage step. Strips everything but digits via
/// [FilteringTextInputFormatter.digitsOnly] before forwarding the value.
class AppSuffixedTextField extends StatelessWidget {
  const AppSuffixedTextField({
    required this.controller,
    required this.suffix,
    this.hint,
    this.onChanged,
    this.maxLength,
    super.key,
  });

  final TextEditingController controller;
  final String suffix;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
      ],
      onChanged: onChanged,
      hint: hint,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          suffix,
          style: AppTextStyles.inputText.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
      suffixIconConstraints: const BoxConstraints(),
    );
  }
}
