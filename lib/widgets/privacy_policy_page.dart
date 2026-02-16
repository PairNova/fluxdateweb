import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Privacy Policy page — Apple App Store & Google Play Store compliant
/// KVKK (Turkish Data Protection Law) uyumlu gizlilik politikası
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
            // Top Navigation Bar
            _buildNavBar(context, isWide),
            // Header
            _buildHeader(isWide),
            // Content
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
                    _buildSection(
                      icon: Icons.info_outline_rounded,
                      title: '1. Giriş',
                      content:
                          'Bu Gizlilik Politikası, FluxDate mobil uygulaması ("Uygulama") '
                          'tarafından toplanan, kullanılan ve paylaşılan kişisel verilere '
                          'ilişkin uygulamalarımızı açıklamaktadır.\n\n'
                          'Uygulamayı kullanarak, bu politikada belirtilen veri toplama ve '
                          'kullanım uygulamalarını kabul etmiş olursunuz. Kişisel verilerinizin '
                          'korunması bizim için en önemli önceliktir.\n\n'
                          '**Uygulama Sahibi:** FluxDate\n'
                          '**İletişim:** info@fluxdate.com\n'
                          '**Son Güncelleme:** 16 Şubat 2026',
                    ),
                    _buildSection(
                      icon: Icons.storage_rounded,
                      title: '2. Toplanan Veriler',
                      content:
                          'Uygulamamız aşağıdaki veri kategorilerini toplayabilir:\n\n'
                          '**Kişisel Bilgiler:**\n'
                          '• Ad, soyad ve kullanıcı adı\n'
                          '• E-posta adresi\n'
                          '• Profil fotoğrafı\n'
                          '• Doğum tarihi\n'
                          '• Cinsiyet bilgisi\n'
                          '• Konum bilgisi (izninizle)\n\n'
                          '**Kullanım Verileri:**\n'
                          '• Uygulama içi etkileşimler ve tercihler\n'
                          '• Oturum süreleri ve sıklığı\n'
                          '• Beğeni ve eşleşme verileri\n\n'
                          '**Cihaz ve Teknik Veriler:**\n'
                          '• Cihaz türü ve işletim sistemi\n'
                          '• Benzersiz cihaz tanımlayıcıları\n'
                          '• IP adresi\n'
                          '• Uygulama sürüm bilgisi',
                    ),
                    _buildSection(
                      icon: Icons.track_changes_rounded,
                      title: '3. Verilerin Kullanım Amaçları',
                      content:
                          'Toplanan veriler aşağıdaki amaçlarla kullanılmaktadır:\n\n'
                          '• Hesabınızı oluşturmak ve yönetmek\n'
                          '• Size uygun eşleşmeler sunmak\n'
                          '• Uygulama deneyiminizi kişiselleştirmek\n'
                          '• Uygulama performansını analiz etmek ve iyileştirmek\n'
                          '• Güvenliğinizi sağlamak ve dolandırıcılığı önlemek\n'
                          '• Yasal yükümlülüklerimizi yerine getirmek\n'
                          '• Size bildirimler ve güncellemeler göndermek (izninizle)\n'
                          '• Müşteri desteği sağlamak',
                    ),
                    _buildSection(
                      icon: Icons.share_rounded,
                      title: '4. Verilerin Paylaşımı ve Üçüncü Taraflar',
                      content:
                          'Kişisel verileriniz aşağıdaki durumlar dışında üçüncü taraflarla '
                          'paylaşılmaz:\n\n'
                          '**Hizmet Sağlayıcılar:**\n'
                          '• Firebase (Google) — Kimlik doğrulama, veritabanı ve analitik\n'
                          '• Google Analytics — Kullanım analitiği\n'
                          '• Bulut depolama hizmetleri\n\n'
                          '**Yasal Gereklilikler:**\n'
                          '• Mahkeme kararı veya yasal zorunluluk durumlarında yetkili makamlarla\n\n'
                          '**Güvenlik:**\n'
                          '• Dolandırıcılık tespiti ve önlenmesi amacıyla güvenlik ortaklarıyla\n\n'
                          'Verileriniz hiçbir koşulda reklam amaçlı üçüncü taraflara '
                          'satılmaz veya kiralanmaz.',
                    ),
                    _buildSection(
                      icon: Icons.security_rounded,
                      title: '5. Veri Saklama ve Güvenlik',
                      content:
                          'Verilerinizin güvenliği için aşağıdaki önlemleri almaktayız:\n\n'
                          '• SSL/TLS şifreleme ile veri aktarımı\n'
                          '• Firebase güvenlik kuralları ile veri erişim kontrolü\n'
                          '• Düzenli güvenlik denetimleri\n'
                          '• Şifrelenmiş veri depolama\n'
                          '• Minimum veri toplama ilkesi\n\n'
                          '**Saklama Süresi:**\n'
                          'Kişisel verileriniz, hesabınız aktif olduğu sürece saklanır. '
                          'Hesabınızı sildiğinizde, verileriniz yasal saklama süreleri '
                          'hariç olmak üzere 30 gün içinde kalıcı olarak silinir.',
                    ),
                    _buildSection(
                      icon: Icons.gavel_rounded,
                      title: '6. Kullanıcı Hakları (KVKK)',
                      content:
                          '6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK) kapsamında '
                          'aşağıdaki haklara sahipsiniz:\n\n'
                          '• Kişisel verilerinizin işlenip işlenmediğini öğrenme\n'
                          '• Kişisel verileriniz işlenmişse buna ilişkin bilgi talep etme\n'
                          '• Kişisel verilerinizin işlenme amacını ve bunların amacına uygun '
                          'kullanılıp kullanılmadığını öğrenme\n'
                          '• Yurt içinde veya yurt dışında kişisel verilerin aktarıldığı üçüncü '
                          'kişileri bilme\n'
                          '• Kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların '
                          'düzeltilmesini isteme\n'
                          '• KVKK\'nın 7. maddesinde öngörülen şartlar çerçevesinde kişisel '
                          'verilerin silinmesini veya yok edilmesini isteme\n'
                          '• İşlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz '
                          'edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya '
                          'çıkmasına itiraz etme\n'
                          '• Kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara '
                          'uğranması hâlinde zararın giderilmesini talep etme\n\n'
                          'Bu haklarınızı kullanmak için **info@fluxdate.com** adresinden '
                          'bizimle iletişime geçebilirsiniz.',
                    ),
                    _buildSection(
                      icon: Icons.cookie_outlined,
                      title: '7. Çerezler ve Takip Teknolojileri',
                      content:
                          'Uygulamamız aşağıdaki teknolojileri kullanabilir:\n\n'
                          '• **Firebase Analytics:** Uygulama kullanım istatistiklerini '
                          'toplamak için\n'
                          '• **Firebase Crashlytics:** Uygulama hatalarını tespit etmek ve '
                          'düzeltmek için\n'
                          '• **Yerel depolama:** Uygulama tercihlerinizi kaydetmek için\n\n'
                          'Bu teknolojiler, uygulamanın düzgün çalışmasını sağlamak ve '
                          'deneyiminizi iyileştirmek amacıyla kullanılmaktadır. '
                          'Cihaz ayarlarınızdan analitik veri paylaşımını kapatabilirsiniz.',
                    ),
                    _buildSection(
                      icon: Icons.child_care_rounded,
                      title: '8. Çocukların Gizliliği',
                      content:
                          'FluxDate, 18 yaşın altındaki bireylere yönelik değildir. '
                          'Bilerek 18 yaşından küçük kullanıcılardan kişisel veri toplamayız.\n\n'
                          'Eğer 18 yaşından küçük bir kullanıcının veri sağladığını fark ederseniz, '
                          'lütfen derhal **info@fluxdate.com** adresi üzerinden bizimle iletişime '
                          'geçin. Bu tür verileri en kısa sürede silmek için gerekli adımları '
                          'atacağız.\n\n'
                          'Ebeveynlerin ve vasilerin, çocuklarının internet ve mobil uygulama '
                          'kullanımını izlemeleri ve yönetmeleri önemle tavsiye edilir.',
                    ),
                    _buildSection(
                      icon: Icons.update_rounded,
                      title: '9. Politika Değişiklikleri',
                      content:
                          'Bu Gizlilik Politikası zaman zaman güncellenebilir. Politikada yapılan '
                          'önemli değişiklikler hakkında sizi aşağıdaki yollarla '
                          'bilgilendireceğiz:\n\n'
                          '• Uygulama içi bildirim\n'
                          '• E-posta bildirimi\n'
                          '• Bu sayfanın güncellenmesi\n\n'
                          'Değişikliklerden sonra uygulamayı kullanmaya devam etmeniz, '
                          'güncellenmiş politikayı kabul ettiğiniz anlamına gelir. '
                          'Politikayı düzenli olarak gözden geçirmenizi öneririz.',
                    ),
                    _buildSection(
                      icon: Icons.contact_mail_rounded,
                      title: '10. İletişim',
                      content:
                          'Gizlilik politikamız veya kişisel verilerinizin işlenmesi hakkında '
                          'sorularınız, talepleriniz veya şikayetleriniz için bizimle iletişime '
                          'geçebilirsiniz:\n\n'
                          '📧 **E-posta:** info@fluxdate.com\n'
                          '🌐 **Web Sitesi:** www.fluxdate.com\n\n'
                          'Talepleriniz en geç 30 gün içinde yanıtlanacaktır.',
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            _buildFooter(),
          ],
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
          // Back button
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
          // Logo
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

  /// Gradient header with title
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
              Icons.shield_rounded,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXLarge),
          Text(
            'Gizlilik Politikası',
            style: AppTextStyles.sectionTitleWhite(isWide),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Text(
            'Verilerinizin güvenliği bizim önceliğimizdir',
            style: AppTextStyles.bodyLarge
                .copyWith(color: Colors.white.withAlpha(204)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(26),
              borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
            ),
            child: Text(
              'Son Güncelleme: 16 Şubat 2026',
              style: AppTextStyles.badgeSmall
                  .copyWith(color: Colors.white.withAlpha(204)),
            ),
          ),
        ],
      ),
    );
  }

  /// Single policy section card
  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : AppDimensions.spacingXLarge,
      ),
      child: Container(
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
            // Section header
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
                  child: Text(
                    title,
                    style: AppTextStyles.cardTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingLarge),
            // Divider
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
            const SizedBox(height: AppDimensions.spacingLarge),
            // Content with rich text parsing
            _buildRichContent(content),
          ],
        ),
      ),
    );
  }

  /// Parses basic markdown-style bold text and renders as RichText
  Widget _buildRichContent(String content) {
    final paragraphs = content.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((paragraph) {
        if (paragraph.isEmpty) return const SizedBox(height: 8);
        // Parse bold text within paragraph
        final spans = <TextSpan>[];
        final boldRegex = RegExp(r'\*\*(.*?)\*\*');
        int lastEnd = 0;
        for (final match in boldRegex.allMatches(paragraph)) {
          if (match.start > lastEnd) {
            spans.add(TextSpan(text: paragraph.substring(lastEnd, match.start)));
          }
          spans.add(TextSpan(
            text: match.group(1),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ));
          lastEnd = match.end;
        }
        if (lastEnd < paragraph.length) {
          spans.add(TextSpan(text: paragraph.substring(lastEnd)));
        }

        final isBullet = paragraph.trimLeft().startsWith('•');

        return Padding(
          padding: EdgeInsets.only(
            bottom: 4,
            left: isBullet ? 8 : 0,
          ),
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(
                height: 1.8,
                color: AppColors.textGrey,
              ),
              children: spans,
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Footer matching main landing page style
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
          Text('© 2025 FluxDate. Tüm hakları saklıdır.',
              style: AppTextStyles.copyright),
        ],
      ),
    );
  }
}
