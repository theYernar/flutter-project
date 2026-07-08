part of '../resources.dart';

/// Dark-only palette. Values extracted from `assets/design/*.png`.
class AppColors {
  const AppColors._();

  static const Color borderColor = Color(0xff242424);
  static const Color green49 = Color(0xff4CAF50);

  // ---------- Surfaces ----------
  static const Color bgPrimary = Color(0xFF141414);
  static const Color surface1 = Color(0xFF1F1F22);
  static const Color surface2 = Color(0xFF2A2A2D);

  // ---------- Text ----------
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9A9A9C);
  static const Color textTertiary = Color(0xFF7E8085);

  // ---------- Accents ----------
  static const Color grey10 = Color(0xff1A1A1A);
  static const Color grey13 = Color(0xFF222222);
  static const Color grey18 = Color(0xff2E2E2E);
  static const Color grey52 = Color(0xff0E0E0E);
  static const Color grey53 = Color(0xff888888);
  static const Color accentYellow = Color(0xFFF2E631);
  static const Color accentLime = Color(0xFFB6E654);
  static const Color accentBlue = Color(0xFF4F6EE8);
  static const Color accentOrange = Color(0xffE8612A);

  // ---------- Stats ----------
  static const Color statBlue = Color(0xFF3293FF);
  static const Color statTeal = Color(0xFF00E5C9);
  static const Color statPurple = Color(0xFFA55EFA);

  static const Color statPurpleGradStart = Color(0xFF331091);
  static const Color statPurpleGradEnd = Color(0xFF9253ED);
  static const Color statPurpleTrack = Color(0x1A8F50E9);

  static const Color statTealGradStart = Color(0xFF065F6E);
  static const Color statTealGradEnd = Color(0xFF02CBA9);
  static const Color statTealTrack = Color(0x1A02CBA9);

  // ---------- States ----------
  static const Color disabledFill = Color(0xFFD6D6D8);
  static const Color disabledText = Color(0xFF898989);
  static const Color error = Color(0xFFFF5C5C);

  // ---------- Indicators ----------
  static const Color progressEmpty = Color(0xFFE8E8EA);

  // ---------- Rating / health ----------
  static const Color ratingGreen = Color(0xFF3FA34D);
  static const Color healthGood = accentLime;
  static const Color healthWarn = accentYellow;
  static const Color healthDanger = error;

  // ---------- Misc ----------
  static const Color barrierColor = Color.fromRGBO(0, 0, 0, 0.6);

  // Backwards-compat aliases so existing imports don't break.
  static const Color mainColor = accentOrange;
  static const Color white = textPrimary;
  static const Color text = textPrimary;
  static const Color greyText = textSecondary;
  static const Color red = error;
  static const Color line2 = surface1;
}
