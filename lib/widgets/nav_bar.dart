import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Navigation bar widget with logo and CTA button
/// Responsive design for mobile and desktop
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > AppDimensions.tabletBreakpoint;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: AppDimensions.spacingLarge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
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
              Text('FluxDate', style: AppTextStyles.logo),
            ],
          ),
          // CTA Button
          if (isWide)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacingXXLarge - 2,
                vertical: AppDimensions.fontSizeBody,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
              ),
              child: Text('Uygulamayı İndir', style: AppTextStyles.buttonPrimary),
            ),
        ],
      ),
    );
  }
}
