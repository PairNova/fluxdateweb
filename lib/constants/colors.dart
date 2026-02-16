import 'package:flutter/material.dart';

/// FluxDate uygulaması için merkezi renk paleti
/// Tüm renkler buradan çekilmeli, hardcoded değerler kullanılmamalı
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF7B2D8E);
  static const Color secondary = Color(0xFFE91E8C);

  // Text Colors
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textGrey = Color(0xFF666666);
  static const Color textLight = Colors.white;

  // Background Colors
  static const Color backgroundLight = Color(0xFFFAF9FB);
  static const Color backgroundCard = Color(0xFFF5F0F7);
  static const Color backgroundPink = Color(0xFFFDF5FA);
  static const Color backgroundWhite = Colors.white;

  // Accent Colors
  static const Color success = Color(0xFF4ECDC4);
  static const Color error = Color(0xFFFF6B6B);
  static const Color gold = Color(0xFFFFD700);

  // Border Colors
  static const Color border = Color(0xFFEEEEEE);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [backgroundLight, backgroundCard, backgroundPink],
  );

  static const LinearGradient cardBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundCard, backgroundPink],
  );

  // Opacity helpers
  static Color primaryLight([double opacity = 0.1]) =>
      primary.withOpacity(opacity);

  static Color secondaryLight([double opacity = 0.1]) =>
      secondary.withOpacity(opacity);

  static Color textDarkLight([double opacity = 0.5]) =>
      textDark.withOpacity(opacity);
}
