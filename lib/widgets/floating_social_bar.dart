import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/constants.dart';

/// Floating social media bar — sticks to left side on desktop,
/// hidden on mobile (social icons are in footer for mobile)
class FloatingSocialBar extends StatefulWidget {
  const FloatingSocialBar({super.key});

  @override
  State<FloatingSocialBar> createState() => _FloatingSocialBarState();
}

class _FloatingSocialBarState extends State<FloatingSocialBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  static const _socialLinks = [
    _SocialLink(
      icon: FontAwesomeIcons.instagram,
      url: 'https://www.instagram.com/fluxdate?igsh=NWtrNm45ejI4cDB3',
      label: 'Instagram',
      hoverColor: Color(0xFFE4405F),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.facebook.com/share/1CHpsb38ta/',
      label: 'Facebook',
      hoverColor: Color(0xFF1877F2),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.xTwitter,
      url: '', // X linki eklenecek
      label: 'X',
      hoverColor: Colors.white,
    ),
    _SocialLink(
      icon: FontAwesomeIcons.tiktok,
      url: '', // TikTok linki eklenecek
      label: 'TikTok',
      hoverColor: Colors.white,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Delay the entrance animation
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width > AppDimensions.desktopBreakpoint;

    // Only show on desktop
    if (!isWide) return const SizedBox.shrink();

    return Positioned(
      left: 20,
      top: 0,
      bottom: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.textDark.withAlpha(230),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXXLarge),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 20,
                  offset: const Offset(2, 4),
                ),
              ],
              border: Border.all(
                color: Colors.white.withAlpha(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _socialLinks
                  .map((link) => _SocialIconButton(
                        link: link,
                        onTap: () => _openUrl(link.url),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final _SocialLink link;
  final VoidCallback onTap;

  const _SocialIconButton({required this.link, required this.onTap});

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.link.url.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: MouseRegion(
        cursor:
            isActive ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: isActive ? widget.onTap : null,
          child: Tooltip(
            message: widget.link.label,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _isHovered && isActive
                    ? widget.link.hoverColor.withAlpha(40)
                    : Colors.transparent,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusSmall),
              ),
              child: Center(
                child: FaIcon(
                  widget.link.icon,
                  color: _isHovered && isActive
                      ? widget.link.hoverColor
                      : isActive
                          ? Colors.white.withAlpha(180)
                          : Colors.white.withAlpha(60),
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLink {
  final IconData icon;
  final String url;
  final String label;
  final Color hoverColor;

  const _SocialLink({
    required this.icon,
    required this.url,
    required this.label,
    required this.hoverColor,
  });
}
