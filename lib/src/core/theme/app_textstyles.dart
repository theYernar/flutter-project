part of 'resources.dart';

mixin AppTextStyles {
  // ---------- Design-system tokens (synced with design tokens table) ----------

  /// Page / step heading — H5 token (Inter Bold 24/28).
  ///
  /// Non-const because `GoogleFonts.inter` returns a runtime-resolved style.
  static TextStyle get displayTitle => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 28 / 24,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  /// Figma Text Font/H4 token (Inter SemiBold 28/34).
  static TextStyle get h4 => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 34 / 28,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  /// Default body / subtitle text.
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Small body text used for hints and timer captions.
  static const TextStyle bodyCaption = TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Primary CTA button label (e.g. «Получить код»).
  static const TextStyle buttonLabel = TextStyle(
    fontSize: 17,
    height: 1.0,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A1A1A),
  );

  /// Tappable link text (resend code, etc.).
  static const TextStyle linkLabel = TextStyle(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.accentBlue,
  );

  /// OTP digit inside a single box.
  static const TextStyle otpDigit = TextStyle(
    fontSize: 26,
    height: 1.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// Text entered in `AppPhoneField` and similar filled inputs.
  static const TextStyle inputText = TextStyle(
    fontSize: 17,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // ---------- Legacy compact body sizes (kept for future screens) ----------

  static const TextStyle body12Regular = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );

  static const TextStyle body12Medium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle body14Regular = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle body14Medium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle body14Semibold = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle body16Regular = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.37,
  );

  static const TextStyle body16Medium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );

  static const TextStyle body16Semibold = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );

  static const TextStyle title18Medium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.55,
  );

  static const TextStyle title18Semibold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.55,
  );

  static const TextStyle title20Medium = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );

  static const TextStyle title24Bold = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    height: 1.19,
  );

  static const TextStyle title30Semibold = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );

  // ---------- FS Scales ----------

  // fs11
  static const TextStyle fs11w400 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
  static const TextStyle fs11w500 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static const TextStyle fs11w600 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  static const TextStyle fs11w700 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static const TextStyle fs11w800 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w800,
    height: 1.2,
  );
  static const TextStyle fs11w900 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w900,
    height: 1.2,
  );

  // fs12
  static const TextStyle fs12w400 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
  static const TextStyle fs12w500 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static const TextStyle fs12w600 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  static const TextStyle fs12w700 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static const TextStyle fs12w800 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w800,
    height: 1.2,
  );
  static const TextStyle fs12w900 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w900,
    height: 1.2,
  );

  // fs13
  static const TextStyle fs13w400 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
  static const TextStyle fs13w500 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );
  static const TextStyle fs13w600 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  static const TextStyle fs13w700 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  static const TextStyle fs13w800 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w800,
    height: 1.3,
  );
  static const TextStyle fs13w900 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w900,
    height: 1.3,
  );

  // fs14
  static const TextStyle fs14w400 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  static const TextStyle fs14w500 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  static const TextStyle fs14w600 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  static const TextStyle fs14w700 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
  static const TextStyle fs14w800 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w800,
    height: 1.4,
  );
  static const TextStyle fs14w900 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w900,
    height: 1.4,
  );

  // fs15
  static const TextStyle fs15w400 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );
  static const TextStyle fs15w500 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );
  static const TextStyle fs15w600 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );
  static const TextStyle fs15w700 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    height: 1.33,
  );
  static const TextStyle fs15w800 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w800,
    height: 1.33,
  );
  static const TextStyle fs15w900 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w900,
    height: 1.33,
  );

  // fs16
  static const TextStyle fs16w400 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
  static const TextStyle fs16w500 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );
  static const TextStyle fs16w600 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  static const TextStyle fs16w700 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  static const TextStyle fs16w800 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    height: 1.3,
  );
  static const TextStyle fs16w900 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w900,
    height: 1.3,
  );

  // fs17
  static const TextStyle fs17w400 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w400,
    height: 1.37,
  );
  static const TextStyle fs17w500 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    height: 1.37,
  );
  static const TextStyle fs17w600 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    height: 1.37,
  );
  static const TextStyle fs17w700 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    height: 1.37,
  );
  static const TextStyle fs17w800 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    height: 1.37,
  );
  static const TextStyle fs17w900 = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w900,
    height: 1.37,
  );

  // fs18
  static const TextStyle fs18w400 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  static const TextStyle fs18w500 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  static const TextStyle fs18w600 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  static const TextStyle fs18w700 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
  static const TextStyle fs18w800 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    height: 1.4,
  );
  static const TextStyle fs18w900 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w900,
    height: 1.4,
  );

  // fs20
  static const TextStyle fs20w400 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    height: 1.19,
  );
  static const TextStyle fs20w500 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );
  static const TextStyle fs20w600 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );
  static const TextStyle fs20w700 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    height: 1.19,
  );
  static const TextStyle fs20w800 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    height: 1.19,
  );
  static const TextStyle fs20w900 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w900,
    height: 1.19,
  );

  // fs22
  static const TextStyle fs22w400 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    height: 1.19,
  );
  static const TextStyle fs22w500 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );
  static const TextStyle fs22w600 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );
  static const TextStyle fs22w700 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    height: 1.19,
  );
  static const TextStyle fs22w800 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w800,
    height: 1.19,
  );
  static const TextStyle fs22w900 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w900,
    height: 1.19,
  );

  // fs24
  static const TextStyle fs24w400 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
  static const TextStyle fs24w500 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static const TextStyle fs24w600 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  static const TextStyle fs24w700 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static const TextStyle fs24w800 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w800,
    height: 1.2,
  );
  static const TextStyle fs24w900 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    height: 1.2,
  );

  // fs26
  static const TextStyle fs26w400 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    height: 1.23,
  );
  static const TextStyle fs26w500 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w500,
    height: 1.23,
  );
  static const TextStyle fs26w600 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
    height: 1.23,
  );
  static const TextStyle fs26w700 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    height: 1.23,
  );
  static const TextStyle fs26w800 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w800,
    height: 1.23,
  );
  static const TextStyle fs26w900 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w900,
    height: 1.23,
  );

  // fs28
  static const TextStyle fs28w400 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    height: 1.23,
  );
  static const TextStyle fs28w500 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w500,
    height: 1.23,
  );
  static const TextStyle fs28w600 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    height: 1.23,
  );
  static const TextStyle fs28w700 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    height: 1.23,
  );
  static const TextStyle fs28w800 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    height: 1.23,
  );
  static const TextStyle fs28w900 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w900,
    height: 1.23,
  );

  // fs30
  static const TextStyle fs30w400 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w400,
    height: 1.19,
  );
  static const TextStyle fs30w500 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );
  static const TextStyle fs30w600 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );
  static const TextStyle fs30w700 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    height: 1.19,
  );
  static const TextStyle fs30w800 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w800,
    height: 1.19,
  );
  static const TextStyle fs30w900 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
    height: 1.19,
  );

  // fs32
  static const TextStyle fs32w400 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    height: 1.19,
  );
  static const TextStyle fs32w500 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );
  static const TextStyle fs32w600 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );
  static const TextStyle fs32w700 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    height: 1.19,
  );
  static const TextStyle fs32w800 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w800,
    height: 1.19,
  );
  static const TextStyle fs32w900 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w900,
    height: 1.19,
  );
}
