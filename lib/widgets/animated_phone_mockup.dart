import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// Animated phone mockup widget with countdown timer
/// Features floating animation, pulse effects, and rotating gradient ring
class AnimatedPhoneMockup extends StatefulWidget {
  const AnimatedPhoneMockup({super.key});

  @override
  State<AnimatedPhoneMockup> createState() => _AnimatedPhoneMockupState();
}

class _AnimatedPhoneMockupState extends State<AnimatedPhoneMockup>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _pulseController;
  late AnimationController _rotateController;
  late AnimationController _countdownController;
  late Animation<double> _floatAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotateAnimation;

  int _countdown = 60;

  @override
  void initState() {
    super.initState();

    // Floating animation
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // Pulse animation
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOut),
    );

    // Rotate animation for gradient ring
    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(_rotateController);

    // Countdown animation
    _countdownController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
    _countdownController.addListener(_updateCountdown);
  }

  void _updateCountdown() {
    final newCount = 60 - (_countdownController.value * 60).floor();
    if (newCount != _countdown) {
      setState(() {
        _countdown = newCount;
      });
    }
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    _rotateController.dispose();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatAnimation, _pulseAnimation, _rotateAnimation]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Container(
            width: AppDimensions.phoneMockupWidth,
            height: AppDimensions.phoneMockupHeight,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(AppDimensions.radiusPhone),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight(0.25),
                  blurRadius: 60,
                  offset: const Offset(0, 20),
                ),
                BoxShadow(
                  color: AppColors.secondaryLight(0.1),
                  blurRadius: 100,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusPhone),
              child: Container(
                padding: const EdgeInsets.all(AppDimensions.spacingSmall),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.cardBackgroundGradient,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusXXLarge),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated ring with icon
                      _buildAnimatedRing(),
                      const SizedBox(height: AppDimensions.spacingXXLarge),
                      // Countdown timer
                      _buildCountdown(),
                      const SizedBox(height: AppDimensions.spacingSmall),
                      // Animated dots
                      _buildAnimatedDots(),
                      const SizedBox(height: AppDimensions.spacingMedium),
                      Text('Gerçek Bağlantı Anı', style: AppTextStyles.bodyMedium),
                      const SizedBox(height: AppDimensions.spacingXXLarge),
                      // Action buttons
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedRing() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer pulse ring
          Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: 1.15 - _pulseAnimation.value),
                  width: 2,
                ),
              ),
            ),
          ),
          // Rotating gradient ring
          Transform.rotate(
            angle: _rotateAnimation.value * 2 * 3.14159,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    AppColors.secondary,
                    AppColors.primary,
                    AppColors.secondaryLight(0.3),
                    AppColors.secondary,
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.cardBackgroundGradient,
                  ),
                ),
              ),
            ),
          ),
          // Center icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryLight(0.1),
                  AppColors.secondaryLight(0.1),
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.videocam_rounded,
                size: AppDimensions.iconXXLarge,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdown() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.secondary, AppColors.primary],
      ).createShader(bounds),
      child: Text(
        '00:${_countdown.toString().padLeft(2, '0')}',
        style: AppTextStyles.countdown,
      ),
    );
  }

  Widget _buildAnimatedDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300 + index * 100),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: AppDimensions.spacingXSmall,
          height: AppDimensions.spacingXSmall,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _countdown % 3 == index
                ? AppColors.secondary
                : AppColors.secondaryLight(0.3),
          ),
        );
      }),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(Icons.close, AppColors.error),
        const SizedBox(width: AppDimensions.spacingSection),
        _buildActionButton(Icons.favorite, AppColors.success),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      width: AppDimensions.actionButtonSize,
      height: AppDimensions.actionButtonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
      ),
      child: Icon(icon, color: color, size: AppDimensions.iconMedium),
    );
  }
}
