import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// How it works section with 5 step cards
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > AppDimensions.desktopBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: AppDimensions.paddingVerticalSection,
      ),
      color: AppColors.backgroundLight,
      child: Column(
        children: [
          Text(
            'Beş Adımda',
            style: AppTextStyles.sectionTitle(isWide),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(
              'Bilinçli Eşleşme',
              style: AppTextStyles.sectionTitle(isWide).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingHuge),
          Wrap(
            spacing: AppDimensions.spacingLarge,
            runSpacing: AppDimensions.spacingXXLarge,
            alignment: WrapAlignment.center,
            children: const [
              _StepCard(number: '1', title: 'Seçim', description: 'Görüntülü veya yazılı eşleşmeyi seç', icon: Icons.touch_app),
              _StepCard(number: '2', title: 'Aday Arama', description: 'Sistem uygun adayları filtreler', icon: Icons.person_search),
              _StepCard(number: '3', title: 'Etkileşim', description: '60 sn görüntülü veya 1.5 dk yazılı oda', icon: Icons.timer),
              _StepCard(number: '4', title: 'Karar', description: 'Her iki taraf Evet veya Hayır der', icon: Icons.check_circle_outline),
              _StepCard(number: '5', title: 'Sohbet', description: 'Karşılıklı Evet ile sınırsız mesajlaşma', icon: Icons.all_inclusive),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _StepCard({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingXLarge),
        child: Column(
          children: [
            Container(
              width: AppDimensions.stepCircleSize,
              height: AppDimensions.stepCircleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryLight(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(icon, color: AppColors.textLight, size: 36),
            ),
            const SizedBox(height: AppDimensions.spacingLarge),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacingSmall,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLight(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              ),
              child: Text('Adım $number', style: AppTextStyles.badgeSmall),
            ),
            const SizedBox(height: AppDimensions.spacingSmall),
            Text(title, style: AppTextStyles.stepTitle, textAlign: TextAlign.center),
            const SizedBox(height: AppDimensions.spacingXSmall),
            Text(description, style: AppTextStyles.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
