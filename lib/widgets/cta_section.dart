import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Call-to-action section with gradient background
class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > AppDimensions.desktopBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: AppDimensions.paddingVerticalSection,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Eşleşme Sonrası Mesajlaşma',
            style: AppTextStyles.sectionTitleWhite(isWide),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppColors.gold],
            ).createShader(bounds),
            child: Text(
              'Tamamen Ücretsiz',
              style: AppTextStyles.sectionTitleWhite(isWide),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Para, kurulan ilişkiyi kilitlemek için değil. Sadece daha fazla deneme hakkı içindir.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingSection,
              vertical: AppDimensions.spacingLarge,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(AppDimensions.radiusPhone),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.notifications_active, color: AppColors.primary),
                const SizedBox(width: AppDimensions.spacingSmall),
                Text(
                  'Lansmandan Haberdar Ol',
                  style: AppTextStyles.stepTitle.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
