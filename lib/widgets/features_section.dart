import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Features section with two feature cards
/// Responsive layout for mobile (column) and desktop (row)
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > AppDimensions.desktopBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: AppDimensions.paddingVerticalSection,
      ),
      color: AppColors.backgroundWhite,
      child: Column(
        children: [
          Text(
            'İki Farklı Deneyim,',
            style: AppTextStyles.sectionTitle(isWide),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(
              'Tek Felsefe',
              style: AppTextStyles.sectionTitle(isWide).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingHuge),
          isWide
              ? Row(
                  children: [
                    Expanded(
                      child: _buildFeatureCard(
                        title: '60 Saniye',
                        subtitle: 'Görüntülü Eşleşme',
                        description:
                            'Canlı ses, mimik ve anlık tepkiler. Sahte persona kurmak zorlaşır, gerçek kişiliğin öne çıkar.',
                        icon: Icons.videocam_rounded,
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacingXXLarge),
                    Expanded(
                      child: _buildFeatureCard(
                        title: '1.5 Dakika',
                        subtitle: 'Yazılı Eşleşme',
                        description:
                            'Ortak bir soru üzerinden başlayan sohbet. Sosyal kaygısı olanlar için ideal alternatif.',
                        icon: Icons.chat_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildFeatureCard(
                      title: '60 Saniye',
                      subtitle: 'Görüntülü Eşleşme',
                      description:
                          'Canlı ses, mimik ve anlık tepkiler. Sahte persona kurmak zorlaşır, gerçek kişiliğin öne çıkar.',
                      icon: Icons.videocam_rounded,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(height: AppDimensions.spacingXXLarge),
                    _buildFeatureCard(
                      title: '1.5 Dakika',
                      subtitle: 'Yazılı Eşleşme',
                      description:
                          'Ortak bir soru üzerinden başlayan sohbet. Sosyal kaygısı olanlar için ideal alternatif.',
                      icon: Icons.chat_rounded,
                      color: AppColors.primary,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingSection),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppDimensions.radiusXXLarge),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppDimensions.featureIconContainer,
            height: AppDimensions.featureIconContainer,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
            ),
            child: Icon(icon, color: color, size: AppDimensions.iconXLarge),
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Text(title, style: AppTextStyles.featureNumber(color)),
          Text(subtitle, style: AppTextStyles.featureTitle),
          const SizedBox(height: AppDimensions.spacingMedium),
          Text(description, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
