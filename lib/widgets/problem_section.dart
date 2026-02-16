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
            'Bu Sorunlar Sana da',
            style: AppTextStyles.sectionTitle(isWide),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(
              'Tanıdık Geldi mi?',
              style: AppTextStyles.sectionTitle(isWide).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Text(
            'Diğer uygulamalarda yaşadığın hayal kırıklıklarını biliyoruz.',
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
                title: 'Sonsuz Kaydırma',
                description: 'Yüzlerce profili kaydırıyorsun ama kimseyle gerçekten tanışamıyorsun.',
              ),
              _buildProblemCard(
                icon: Icons.chat_bubble_outline,
                title: 'Sahte Profiller',
                description: 'Haftalarca yazışıyorsun ama buluştuğunda karşındaki bambaşka biri çıkıyor.',
              ),
              _buildProblemCard(
                icon: Icons.lock_outline,
                title: 'Her Şey Paralı',
                description: 'Eşleştin ama mesaj atmak için bile ödeme yapmak zorundasın.',
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
