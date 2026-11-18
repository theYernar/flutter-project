import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Four-cell numeric OTP input.
///
/// Visuals are project-defined so we don't depend on Pinput defaults:
/// dark filled boxes (`surface1`), 20px radius, no border, digits styled
/// via [AppTextStyles.otpDigit].
class AppOtpField extends StatelessWidget {
  const AppOtpField({
    required this.controller,
    this.onChanged,
    this.onCompleted,
    this.length = 4,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final int length;

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: AppSizes.otpBox,
      height: AppSizes.otpBox,
      textStyle: AppTextStyles.otpDigit,
      decoration: BoxDecoration(
        color: AppColors.surface1,
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
    );

    return Pinput(
      length: length,
      controller: controller,
      defaultPinTheme: pinTheme,
      focusedPinTheme: pinTheme,
      submittedPinTheme: pinTheme,
      separatorBuilder: (_) => const SizedBox(width: AppGaps.md),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autofocus: true,
      cursor: Container(width: 2, height: 28, color: AppColors.accentYellow),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
