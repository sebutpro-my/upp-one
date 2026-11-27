import 'package:material_ui/material_ui.dart';

/// Official UPP ONE colour system.
///
/// Central colour reference for all application
/// screens, components and modules.
class AppColors {
  AppColors._();

  // ==========================================
  // BRAND COLOURS
  // ==========================================

  static const Color navy = Color(0xFF102B46);
  static const Color gold = Color(0xFFD4B577);

  // ==========================================
  // LIGHT MODE
  // ==========================================

  static const Color lightBackground =
      Color(0xFFF5F7FA);

  static const Color lightSurface =
      Color(0xFFFFFFFF);

  static const Color lightPrimaryText =
      Color(0xFF102B46);

  static const Color lightSecondaryText =
      Color(0xFF64748B);

  static const Color lightBorder =
      Color(0xFFE2E8F0);

  static const Color lightSecondarySurface =
      Color(0xFFEDF2F7);

  // ==========================================
  // DARK MODE
  // ==========================================

  static const Color darkBackground =
      Color(0xFF101C2C);

  static const Color darkSurface =
      Color(0xFF1C2D41);

  static const Color darkPrimaryText =
      Color(0xFFFFFFFF);

  static const Color darkSecondaryText =
      Color(0xFFA8B8CC);

  static const Color darkBorder =
      Color(0xFF34475D);

  static const Color darkSecondarySurface =
      Color(0xFF263A50);

  // ==========================================
  // SYSTEM STATUS - LIGHT MODE
  // ==========================================

  static const Color success =
      Color(0xFF15803D);

  static const Color warning =
      Color(0xFFB45309);

  static const Color error =
      Color(0xFFDC2626);

  static const Color info =
      Color(0xFF2563EB);

  // ==========================================
  // SYSTEM STATUS - DARK MODE
  // ==========================================

  static const Color darkSuccess =
      Color(0xFF4ADE80);

  static const Color darkWarning =
      Color(0xFFFBBF24);

  static const Color darkError =
      Color(0xFFF87171);

  static const Color darkInfo =
      Color(0xFF60A5FA);

  // ==========================================
  // ADAPTIVE COLOUR HELPERS
  // ==========================================

  static Color background(bool isDark) =>
      isDark ? darkBackground : lightBackground;

  static Color surface(bool isDark) =>
      isDark ? darkSurface : lightSurface;

  static Color primaryText(bool isDark) =>
      isDark ? darkPrimaryText : lightPrimaryText;

  static Color secondaryText(bool isDark) =>
      isDark ? darkSecondaryText : lightSecondaryText;

  static Color border(bool isDark) =>
      isDark ? darkBorder : lightBorder;

  static Color secondarySurface(bool isDark) =>
      isDark
          ? darkSecondarySurface
          : lightSecondarySurface;

  static Color primary(bool isDark) =>
      isDark ? gold : navy;

  static Color onPrimary(bool isDark) =>
      isDark ? navy : Colors.white;

  static Color statusSuccess(bool isDark) =>
      isDark ? darkSuccess : success;

  static Color statusWarning(bool isDark) =>
      isDark ? darkWarning : warning;

  static Color statusError(bool isDark) =>
      isDark ? darkError : error;

  static Color statusInfo(bool isDark) =>
      isDark ? darkInfo : info;
}
