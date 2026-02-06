import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'dimensions.dart';

/// FluxDate uygulaması için merkezi text stilleri
/// Tüm text stilleri buradan çekilmeli
class AppTextStyles {
  AppTextStyles._();

  // Hero Titles
  static TextStyle heroTitle(bool isWide) => GoogleFonts.inter(
        fontSize: AppDimensions.responsiveHeroSize(isWide),
        fontWeight: FontWeight.w800,
        color: AppColors.textDark,
        height: 1.1,
      );

  static TextStyle heroTitleGradient(bool isWide) => GoogleFonts.inter(
        fontSize: AppDimensions.responsiveHeroSize(isWide),
        fontWeight: FontWeight.w800,
        color: Colors.white,
        height: 1.1,
      );

  // Section Titles
  static TextStyle sectionTitle(bool isWide) => GoogleFonts.inter(
        fontSize: AppDimensions.responsiveTitleSize(isWide),
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      );

  static TextStyle sectionTitleWhite(bool isWide) => GoogleFonts.inter(
        fontSize: AppDimensions.responsiveTitleSize(isWide),
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
      );

  // Body Text
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeLarge,
    color: AppColors.textGrey,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeMedium,
    color: AppColors.textGrey,
    height: 1.6,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeBody,
    color: AppColors.textGrey,
    height: 1.5,
  );

  // Card Titles
  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeXLarge,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle cardSubtitle = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeBody + 1,
    color: AppColors.textGrey,
    height: 1.6,
  );

  // Feature Styles
  static TextStyle featureNumber(Color color) => GoogleFonts.inter(
        fontSize: AppDimensions.fontSizeFeature,
        fontWeight: FontWeight.w800,
        color: color,
      );

  static TextStyle featureTitle = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeTitle,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  // Button Text
  static TextStyle buttonPrimary = GoogleFonts.inter(
    color: AppColors.textLight,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonSecondary = GoogleFonts.inter(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );

  // Logo
  static TextStyle logo = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeTitle,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static TextStyle logoWhite = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeTitle,
    fontWeight: FontWeight.w700,
    color: AppColors.textLight,
  );

  // Badge/Chip
  static TextStyle badge = GoogleFonts.inter(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    fontSize: AppDimensions.fontSizeBody,
  );

  static TextStyle badgeSmall = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeSmall + 1,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  // Step
  static TextStyle stepTitle = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeLarge,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  // Countdown
  static TextStyle countdown = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeCountdown,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: 2,
  );

  // Store Button
  static TextStyle storeButtonSmall = GoogleFonts.inter(
    color: Colors.white70,
    fontSize: AppDimensions.fontSizeSmall,
  );

  static TextStyle storeButtonLarge = GoogleFonts.inter(
    color: Colors.white,
    fontSize: AppDimensions.fontSizeMedium,
    fontWeight: FontWeight.w600,
  );

  // Quote
  static TextStyle quote = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeXLarge,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  );

  // Hashtag
  static TextStyle hashtag = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeMedium,
    color: AppColors.secondary,
    fontWeight: FontWeight.w600,
  );

  // Copyright
  static TextStyle copyright = GoogleFonts.inter(
    fontSize: AppDimensions.fontSizeBody,
    color: Colors.white54,
  );
}
