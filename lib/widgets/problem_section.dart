import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Problem section showcasing pain points of modern dating apps
class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

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
            'Modern Flört Dünyasının',
            style: AppTextStyles.sectionTitle(isWide),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(
              'Kırık Denklemi',
              style: AppTextStyles.sectionTitle(isWide).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Text(
            'Klasik flört uygulamaları seni yoruyor mu?',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingHuge),
          Wrap(
            spacing: AppDimensions.spacingXXLarge,
            runSpacing: AppDimensions.spacingXXLarge,
            alignment: WrapAlignment.center,
            children: [
              _buildProblemCard(
                icon: Icons.swipe,
                title: 'Karar Felci',
                description: 'Yüzlerce profil arasında kaybolmak, seçim yapmayı imkansızlaştırıyor.',
              ),
              _buildProblemCard(
                icon: Icons.chat_bubble_outline,
                title: 'Hayal Kırıklığı',
                description: 'Aylar süren yazışmalar, buluşmada hayal kırıklığıyla sonuçlanıyor.',
              ),
              _buildProblemCard(
                icon: Icons.lock_outline,
                title: 'Sömürülme Hissi',
                description: 'Eşleşme sonrası iletişim için ödeme yapmak zorunda kalmak.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProblemCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(AppDimensions.radiusXXLarge),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primaryLight(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            ),
            child: Icon(icon, color: AppColors.primary, size: AppDimensions.iconLarge),
          ),
          const SizedBox(height: AppDimensions.spacingLarge),
          Text(title, style: AppTextStyles.cardTitle),
          const SizedBox(height: AppDimensions.spacingSmall),
          Text(
            description,
            style: AppTextStyles.cardSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
