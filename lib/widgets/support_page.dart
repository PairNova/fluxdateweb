import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/constants.dart';

/// Support / Contact page — Apple App Store & Google Play Store compliant
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'fluxdate@fluxdate.com',
      queryParameters: {'subject': 'FluxDate Destek Talebi'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width > AppDimensions.tabletBreakpoint;
    final contentWidth = isWide ? 800.0 : double.infinity;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavBar(context, isWide),
            _buildHeader(isWide),
            Center(
              child: Container(
                width: contentWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.responsivePadding(isWide),
                  vertical: AppDimensions.spacingSection,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Card
                    _buildContactCard(isWide),
                    const SizedBox(height: AppDimensions.spacingXLarge),
                    // FAQ Section
                    _buildSection(
                      icon: Icons.help_outline_rounded,
                      title: 'Sıkça Sorulan Sorular',
                      child: Column(
                        children: [
                          _buildFaqItem(
                            'FluxDate nedir?',
                            'FluxDate, gerçek bağlantılar kurmana yardımcı olan bir tanışma uygulamasıdır. '
                                'Görüntülü ve yazılı eşleşme modlarıyla sana özel bir deneyim sunar.',
                          ),
                          _buildFaqItem(
                            'FluxDate ücretsiz mi?',
                            'Evet! Eşleştikten sonra mesajlaşmak tamamen ücretsiz. '
                                'Premium özellikler ile daha fazla eşleşme hakkı alabilirsin.',
                          ),
                          _buildFaqItem(
                            'Hesabımı nasıl silebilirim?',
                            'Uygulama içinden Ayarlar > Hesap > Hesabı Sil yolunu takip edebilirsin. '
                                'Ayrıca fluxdate@fluxdate.com adresine mail atarak da hesap silme talebinde bulunabilirsin.',
                          ),
                          _buildFaqItem(
                            'Verilerim güvende mi?',
                            'Evet! Tüm veriler şifreli olarak saklanır ve üçüncü taraflarla paylaşılmaz. '
                                'Detaylar için Gizlilik Politikamızı inceleyebilirsin.',
                          ),
                          _buildFaqItem(
                            'Eşleşme nasıl çalışır?',
                            '60 saniyelik görüntülü veya 1.5 dakikalık yazılı sohbet ile tanışırsın. '
                                'Süre sonunda iki taraf da beğenirse eşleşme gerçekleşir.',
                          ),
                          _buildFaqItem(
                            'Bir kullanıcıyı nasıl şikayet edebilirim?',
                            'Kullanıcının profilinde bulunan şikayet butonunu kullanabilir veya '
                                'fluxdate@fluxdate.com adresine detaylı bilgi ile mail atabilirsin.',
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingXLarge),
                    // Policies Section
                    _buildSection(
                      icon: Icons.description_outlined,
                      title: 'Yasal Bilgiler',
                      child: Column(
                        children: [
                          _buildPolicyLink(
                            context,
                            icon: Icons.shield_rounded,
                            title: 'Gizlilik Politikası',
                            subtitle:
                                'Kişisel verilerinizin nasıl toplandığı ve korunduğu hakkında bilgi',
                            route: '/privacy-policy',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingXLarge),
                    // Response Time Info
                    _buildSection(
                      icon: Icons.schedule_rounded,
                      title: 'Yanıt Süresi',
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Destek talepleriniz en geç 48 saat içinde yanıtlanacaktır. '
                          'Acil durumlar için e-posta konusuna "ACİL" yazmanızı rica ederiz.\n\n'
                          'Çalışma saatleri: Pazartesi - Cuma, 09:00 - 18:00 (TSİ)',
                          style: AppTextStyles.bodySmall.copyWith(
                            height: 1.8,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Contact card with email button
  Widget _buildContactCard(bool isWide) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingXLarge),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7B2D8E),
            Color(0xFFE91E8C),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(40),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.email_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLarge),
          Text(
            'Bize Ulaş',
            style: AppTextStyles.sectionTitleWhite(isWide).copyWith(
              fontSize: isWide ? 28 : 22,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSmall),
          Text(
            'Her türlü soru, öneri ve geri bildirim için buradayız!',
            style: AppTextStyles.bodyLarge.copyWith(
              color: Colors.white.withAlpha(204),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _launchEmail,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusRound),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(26),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.mail_outline_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'fluxdate@fluxdate.com',
                      style: AppTextStyles.cardTitle.copyWith(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section card wrapper
  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingXLarge),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(13),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusSmall),
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: AppDimensions.spacingMedium),
              Expanded(
                child: Text(title, style: AppTextStyles.cardTitle),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLarge),
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withAlpha(51),
                  AppColors.secondary.withAlpha(51),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  /// FAQ accordion item
  Widget _buildFaqItem(String question, String answer,
      {bool isLast = false}) {
    return _FaqItem(
      question: question,
      answer: answer,
      isLast: isLast,
    );
  }

  /// Policy link row
  Widget _buildPolicyLink(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.spacingMedium),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(route),
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.spacingMedium),
            decoration: BoxDecoration(
              color: AppColors.backgroundCard,
              borderRadius:
                  BorderRadius.circular(AppDimensions.radiusSmall),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: AppDimensions.spacingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.cardTitle.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textGrey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Top navigation bar with back button
  Widget _buildNavBar(BuildContext context, bool isWide) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: AppDimensions.spacingLarge,
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacingMedium,
                  vertical: AppDimensions.spacingXSmall,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundCard,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusRound),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 16, color: AppColors.primary),
                    const SizedBox(width: AppDimensions.spacingXSmall),
                    Text('Ana Sayfa',
                        style: AppTextStyles.badge.copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: AppDimensions.logoSize,
                height: AppDimensions.logoSize,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusSmall),
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
        ],
      ),
    );
  }

  /// Header with gradient
  Widget _buildHeader(bool isWide) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.responsivePadding(isWide),
        vertical: isWide
            ? AppDimensions.spacingHuge
            : AppDimensions.spacingSection,
      ),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent_rounded,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Text(
            'Destek Merkezi',
            style: AppTextStyles.sectionTitleWhite(isWide),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Text(
            'Sana yardımcı olmak için buradayız',
            style: AppTextStyles.bodyLarge
                .copyWith(color: Colors.white.withAlpha(204)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Footer
  Widget _buildFooter() {
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
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusSmall),
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
          Text('© 2026 FluxDate. Tüm hakları saklıdır.',
              style: AppTextStyles.copyright),
        ],
      ),
    );
  }
}

/// Expanding FAQ item with animation
class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isLast;

  const _FaqItem({
    required this.question,
    required this.answer,
    this.isLast = false,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.spacingMedium),
              decoration: BoxDecoration(
                color: _expanded
                    ? AppColors.primaryLight(0.08)
                    : AppColors.backgroundCard,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusSmall),
                border: Border.all(
                  color: _expanded
                      ? AppColors.primary.withAlpha(40)
                      : AppColors.border,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.question,
                          style: AppTextStyles.cardTitle.copyWith(
                            fontSize: 15,
                            color: _expanded
                                ? AppColors.primary
                                : AppColors.textDark,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: _expanded
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        widget.answer,
                        style: AppTextStyles.bodySmall.copyWith(
                          height: 1.7,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                    crossFadeState: _expanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
