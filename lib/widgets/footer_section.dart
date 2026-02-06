import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Footer section with logo and copyright
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontalMobile,
        vertical: AppDimensions.spacingSection,
      ),
      color: AppColors.textDark,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppDimensions.logoSize,
                height: AppDimensions.logoSize,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.textLight,
                  size: AppDimensions.iconSmall,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSmall),
              Text('FluxDate', style: AppTextStyles.logoWhite),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Text('#RastlantıdanBilinçliSeçime', style: AppTextStyles.hashtag),
          const SizedBox(height: AppDimensions.spacingXXLarge),
          Text('© 2025 FluxDate. Tüm hakları saklıdır.', style: AppTextStyles.copyright),
        ],
      ),
    );
  }
}
