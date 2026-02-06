import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'animated_phone_mockup.dart';

/// Hero section with main headline, subtext, and phone mockup
/// Responsive layout for mobile (column) and desktop (row)
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > AppDimensions.desktopBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: isWide
            ? AppDimensions.paddingVerticalDesktopHero
            : AppDimensions.paddingVerticalMobileHero,
      ),
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildTextContent(context, isWide)),
                const SizedBox(width: AppDimensions.spacingHuge),
                const Expanded(child: AnimatedPhoneMockup()),
              ],
            )
          : Column(
              children: [
                _buildTextContent(context, isWide),
                const SizedBox(height: 50),
                const AnimatedPhoneMockup(),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isWide) {
    return Column(
      crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMedium,
            vertical: AppDimensions.spacingXSmall,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLight(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          child: Text('Yeni Nesil Tanışma Deneyimi', style: AppTextStyles.badge),
        ),
        const SizedBox(height: AppDimensions.spacingXLarge),
        // Main Title
        Text(
          'Rastlantıdan',
          style: AppTextStyles.heroTitle(isWide),
          textAlign: isWide ? TextAlign.left : TextAlign.center,
        ),
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            'Bilinçli Seçime.',
            style: AppTextStyles.heroTitleGradient(isWide),
            textAlign: isWide ? TextAlign.left : TextAlign.center,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingXLarge),
        // Subtitle
        Text(
          'Kısa, gerçek ve net temaslar üzerinden ilişki kurma deneyimi. Sadece 60 saniyede gerçek bağlantılar kur.',
          style: AppTextStyles.bodyLarge,
          textAlign: isWide ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spacingSection),
        // Store buttons
        Wrap(
          spacing: AppDimensions.spacingMedium,
          runSpacing: AppDimensions.spacingMedium,
          alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _buildStoreButton('App Store', Icons.apple),
            _buildStoreButton('Google Play', Icons.play_arrow),
          ],
        ),
      ],
    );
  }

  Widget _buildStoreButton(String store, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingXLarge,
        vertical: AppDimensions.spacingMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppDimensions.fontSizeBody),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.textLight, size: AppDimensions.iconMedium),
          const SizedBox(width: AppDimensions.spacingSmall),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Yakında', style: AppTextStyles.storeButtonSmall),
              Text(store, style: AppTextStyles.storeButtonLarge),
            ],
          ),
        ],
      ),
    );
  }
}
