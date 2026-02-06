/// FluxDate uygulaması için merkezi boyut sabitleri
/// Padding, margin, border radius gibi değerler buradan çekilmeli
class AppDimensions {
  AppDimensions._();

  // Breakpoints
  static const double tabletBreakpoint = 800.0;
  static const double desktopBreakpoint = 900.0;

  // Horizontal Padding
  static const double paddingHorizontalMobile = 24.0;
  static const double paddingHorizontalDesktop = 80.0;

  // Vertical Padding
  static const double paddingVerticalSection = 100.0;
  static const double paddingVerticalMobileHero = 60.0;
  static const double paddingVerticalDesktopHero = 100.0;

  // Border Radius
  static const double radiusSmall = 12.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 20.0;
  static const double radiusXLarge = 24.0;
  static const double radiusXXLarge = 32.0;
  static const double radiusRound = 30.0;
  static const double radiusPhone = 40.0;

  // Icon Sizes
  static const double iconSmall = 22.0;
  static const double iconMedium = 28.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 40.0;
  static const double iconXXLarge = 45.0;

  // Element Sizes
  static const double logoSize = 40.0;
  static const double phoneMockupWidth = 300.0;
  static const double phoneMockupHeight = 600.0;
  static const double actionButtonSize = 56.0;
  static const double stepCircleSize = 80.0;
  static const double featureIconContainer = 80.0;

  // Spacing
  static const double spacingXSmall = 8.0;
  static const double spacingSmall = 12.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 20.0;
  static const double spacingXLarge = 24.0;
  static const double spacingXXLarge = 30.0;
  static const double spacingSection = 40.0;
  static const double spacingHuge = 60.0;

  // Font Sizes
  static const double fontSizeSmall = 11.0;
  static const double fontSizeBody = 14.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeXLarge = 20.0;
  static const double fontSizeTitle = 24.0;
  static const double fontSizeTitleMobile = 28.0;
  static const double fontSizeTitleDesktop = 42.0;
  static const double fontSizeHeroMobile = 42.0;
  static const double fontSizeHeroDesktop = 64.0;
  static const double fontSizeFeature = 48.0;
  static const double fontSizeCountdown = 52.0;

  // Helper methods
  static double responsivePadding(bool isWide) =>
      isWide ? paddingHorizontalDesktop : paddingHorizontalMobile;

  static double responsiveTitleSize(bool isWide) =>
      isWide ? fontSizeTitleDesktop : fontSizeTitleMobile;

  static double responsiveHeroSize(bool isWide) =>
      isWide ? fontSizeHeroDesktop : fontSizeHeroMobile;
}
