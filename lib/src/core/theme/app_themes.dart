part of 'resources.dart';

mixin AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    splashColor: const Color.fromARGB(64, 42, 42, 42),
    highlightColor: const Color.fromARGB(64, 42, 42, 42),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.mainColor,
      onPrimary: Color(0xFF1A1A1A),
      secondary: AppColors.accentLime,
      onSecondary: Color(0xFF1A1A1A),
      surface: AppColors.surface1,
      error: AppColors.error,
      onError: AppColors.textPrimary,
    ),
    textTheme: defaultTargetPlatform == TargetPlatform.iOS
        ? const TextTheme(
            displayLarge: TextStyle(letterSpacing: -0.5),
            displayMedium: TextStyle(letterSpacing: -0.5),
            displaySmall: TextStyle(letterSpacing: -0.5),
            bodyLarge: TextStyle(letterSpacing: -0.5),
            bodyMedium: TextStyle(letterSpacing: -0.5),
            bodySmall: TextStyle(letterSpacing: -0.5),
          )
        : null,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.bgPrimary,
      foregroundColor: AppColors.textPrimary,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surface1,
      modalBarrierColor: AppColors.barrierColor,
      dragHandleColor: AppColors.textTertiary,
      dragHandleSize: Size(48, 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface1,
      hintStyle: TextStyle(
        fontSize: 17,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: TextStyle(fontSize: 14, color: AppColors.error),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
    ),
    // Fallback styling for plain ElevatedButton usages. Prefer
    // `AppPrimaryButton` in new code.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF1A1A1A),
        backgroundColor: AppColors.accentYellow,
        disabledBackgroundColor: AppColors.disabledFill,
        disabledForegroundColor: AppColors.disabledText,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
        ),
      ),
    ),
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    splashColor: const Color.fromARGB(32, 0, 0, 0),
    highlightColor: const Color.fromARGB(32, 0, 0, 0),
    colorScheme: const ColorScheme.light(
      primary: AppColors.mainColor,
      onPrimary: Colors.white,
      secondary: AppColors.accentLime,
      onSecondary: Color(0xFF1A1A1A),
      surface: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
    ),
    textTheme: defaultTargetPlatform == TargetPlatform.iOS
        ? const TextTheme(
            displayLarge: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
            displayMedium: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
            displaySmall: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
            bodyLarge: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
            bodyMedium: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
            bodySmall: TextStyle(letterSpacing: -0.5, color: Color(0xFF1A1A1A)),
          )
        : null,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFFF5F5F5),
      foregroundColor: Color(0xFF1A1A1A),
      titleTextStyle: TextStyle(
        color: Color(0xFF1A1A1A),
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBarrierColor: AppColors.barrierColor,
      dragHandleColor: Color(0xFFC7C7CC),
      dragHandleSize: Size(48, 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 17, color: Color(0xFF8E8E93), fontWeight: FontWeight.w500),
      errorStyle: TextStyle(fontSize: 14, color: AppColors.error),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF1A1A1A),
        backgroundColor: AppColors.accentYellow,
        disabledBackgroundColor: AppColors.disabledFill,
        disabledForegroundColor: AppColors.disabledText,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
        ),
      ),
    ),
  );
}
