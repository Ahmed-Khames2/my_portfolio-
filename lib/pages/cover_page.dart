import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/AnimatedTextKit.dart';
import 'package:my_portfolio2/widgets/CTA_Buttons.dart';
import 'package:my_portfolio2/widgets/LocationAndStatus.dart';
import 'package:my_portfolio2/widgets/MobileImage.dart';

class CoverSection extends StatelessWidget {
  final GlobalKey contactKey;

  const CoverSection({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final locale = Localizations.localeOf(context).languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    final fontFamily = locale == "ar" ? "Cairo" : "Roboto";

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 0.0 : 70,
        horizontal: isMobile ? 16 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.secondary.withOpacity(.9),
            colorScheme.primary.withOpacity(.8),
            // colorScheme.background,
            isDark ? Colors.black : Color(0xFF02569B), // 👈 بدل الأبيض بخفيف
            // Colors.black,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // ===== LEFT SIDE =====
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(
                right: isMobile ? 0 : 32,
                bottom: isMobile ? 24 : 0,
              ),
              child: Column(
                crossAxisAlignment:
                    isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // ===== Animated Title =====
                  AnimatedTitle(
                    isMobile: isMobile,
                    isTablet: isTablet,
                    fontFamily: fontFamily,
                    textTheme: t,
                    colorScheme: colorScheme,
                  ),

                  const SizedBox(height: 16),

                  // ===== Position / Study =====
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "junior".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 15 : 20,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        TextSpan(
                          text: "flutter_dev".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 17 : 24,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "cs_student".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 15 : 20,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  ).animate().fadeIn(duration: 500.ms),

                  const SizedBox(height: 24),

                  // ===== Description =====
                  Text(
                    "specialization".tr(context),
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: t.bodyLarge?.copyWith(
                      fontFamily: fontFamily,
                      fontSize: isMobile ? 13 : 15,
                      color: colorScheme.onPrimary.withOpacity(.9),
                      height: 1.6,
                    ),
                  ).animate().fadeIn(duration: 600.ms),
                  const SizedBox(height: 24),
                  // ===== Location + Status =====
                  LocationAndStatus(
                    isMobile: isMobile,
                    t: t,
                    fontFamily: fontFamily,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 40),
                  // ===== CTA Buttons =====
                  CTA_Buttons(
                    isMobile: isMobile,
                    contactKey: contactKey,
                    locale: locale,
                    fontFamily: fontFamily,
                    colorScheme: colorScheme,
                  ),
                ],
              ),
            ),
          ),

          // ===== RIGHT SIDE (Mobile Mockup) =====
          MobileImage(isMobile: isMobile, isTablet: isTablet),
        ],
      ),
    );
  }
}
