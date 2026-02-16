import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/constants.dart';

/// Footer section with logo, social media, and copyright
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const _socialLinks = [
    _SocialLink(
      icon: FontAwesomeIcons.instagram,
      url: 'https://www.instagram.com/fluxdate?igsh=NWtrNm45ejI4cDB3',
      label: 'Instagram',
      color: Color(0xFFE4405F),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.facebook.com/share/1CHpsb38ta/',
      label: 'Facebook',
      color: Color(0xFF1877F2),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.xTwitter,
      url: '', // X linki eklenecek
      label: 'X',
      color: Colors.white,
    ),
    _SocialLink(
      icon: FontAwesomeIcons.tiktok,
      url: '', // TikTok linki eklenecek
      label: 'TikTok',
      color: Colors.white,
    ),
  ];

  Future<void> _openUrl(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
          // Logo
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
          const SizedBox(height: AppDimensions.spacingXLarge),
          // Social Media Buttons
          Text(
            'Bizi Takip Et',
            style: AppTextStyles.copyright.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _socialLinks.map((link) {
              final isActive = link.url.isNotEmpty;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MouseRegion(
                  cursor: isActive
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: GestureDetector(
                    onTap: isActive ? () => _openUrl(link.url) : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.white.withAlpha(26)
                            : Colors.white.withAlpha(10),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusSmall,
                        ),
                        border: Border.all(
                          color: isActive
                              ? Colors.white.withAlpha(51)
                              : Colors.white.withAlpha(20),
                        ),
                      ),
                      child: Center(
                        child: FaIcon(
                          link.icon,
                          color: isActive
                              ? link.color
                              : Colors.white.withAlpha(77),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          // Footer Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/privacy-policy'),
                  child: Text(
                    'Gizlilik Politikası',
                    style: AppTextStyles.copyright.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white54,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('•', style: AppTextStyles.copyright),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/support'),
                  child: Text(
                    'Destek',
                    style: AppTextStyles.copyright.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white54,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text('© 2026 FluxDate. Tüm hakları saklıdır.',
              style: AppTextStyles.copyright),
        ],
      ),
    );
  }
}

class _SocialLink {
  final IconData icon;
  final String url;
  final String label;
  final Color color;

  const _SocialLink({
    required this.icon,
    required this.url,
    required this.label,
    required this.color,
  });
}
