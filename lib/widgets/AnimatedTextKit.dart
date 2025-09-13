import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';

class AnimatedTitle extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final String fontFamily;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const AnimatedTitle({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.fontFamily,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(seconds: 2),
      animatedTexts: [
        TypewriterAnimatedText(
          "hi_im".tr(context),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          textStyle: textTheme.displayLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: isMobile ? 26 : (isTablet ? 34 : 42),
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
          ),
          speed: const Duration(milliseconds: 120),
          cursor: "|",
        ),
        // لو حابب تضيف حاجات تانية زي RotateAnimatedText تقدر تكمل هنا
      ],
    ).animate().fadeIn(duration: 500.ms);
  }
}
