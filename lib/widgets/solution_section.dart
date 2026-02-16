import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Solution section with gradient background
class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

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
            'FluxDate ile Tanışmak',
            style: AppTextStyles.sectionTitleWhite(isWide).copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Çok Daha Kolay',
            style: AppTextStyles.sectionTitleWhite(isWide),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              'Profil kaydırmak yerine karşındaki insanı 60 saniyede gerçekten tanı. Görüntülü veya yazılı sohbetle anında bağlantı kur.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingHuge),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingSection,
              vertical: AppDimensions.spacingLarge,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Text(
              '"60 saniye yeter, gerçek biriyle tanışmak için."',
              style: AppTextStyles.quote,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
