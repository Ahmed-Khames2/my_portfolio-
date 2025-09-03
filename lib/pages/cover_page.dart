import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // 📌 مهم للـ typewriter
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/pages/portfolio_page.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).languageCode;

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    final fontFamily = locale == "ar" ? "Cairo" : "Roboto";

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 60,
        horizontal: isMobile ? 16 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(.9), AppColors.background],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  const SizedBox(height: 20),

                  // ===== العنوان الرئيسي بأنيميشن الكتابة =====
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(seconds: 4),
                    animatedTexts: [
                      // الكتابة عادي (من الشمال لليمين)
                      TypewriterAnimatedText(
                        "hi_im".tr(context),
                        textAlign:
                            isMobile ? TextAlign.center : TextAlign.start,
                        textStyle: t.displayLarge?.copyWith(
                          fontFamily: fontFamily,
                          fontSize: isMobile ? 26 : (isTablet ? 34 : 42),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        speed: const Duration(milliseconds: 120),
                        cursor: "|",
                      ),

                      // المسح (هنخليها تكتب من اليمين للشمال كأنها بتمسح)
                      TypewriterAnimatedText(
                        "hi_im".tr(context),
                        textAlign:
                            isMobile ? TextAlign.center : TextAlign.start,
                        textStyle: t.displayLarge?.copyWith(
                          fontFamily: fontFamily,
                          fontSize: isMobile ? 26 : (isTablet ? 34 : 42),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        speed: const Duration(milliseconds: 120),
                        cursor: "|",
                        // textDirection: TextDirection.rtl, // دي اللي بتدي الإحساس بالعكس
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // الوظيفة + الدراسة
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "junior".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 15 : 20,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: "flutter_dev".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 17 : 24,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "cs_student".tr(context),
                          style: t.headlineMedium?.copyWith(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 15 : 20,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  ).animate().fadeIn(duration: 500.ms),

                  const SizedBox(height: 24),

                  // الوصف
                  Text(
                    "specialization".tr(context),
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: t.bodyLarge?.copyWith(
                      fontFamily: fontFamily,
                      fontSize: isMobile ? 13 : 15,
                      color: AppColors.textPrimary.withOpacity(.9),
                      height: 1.6,
                    ),
                  ).animate().fadeIn(duration: 600.ms),

                  const SizedBox(height: 24),

                  // ===== Location + Status =====
                  Column(
                    crossAxisAlignment:
                        isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.greenAccent,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              "location".tr(context),
                              style: t.bodyMedium?.copyWith(
                                fontFamily: fontFamily,
                                fontSize: isMobile ? 13 : 15,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              "availability".tr(context),
                              style: t.bodyMedium?.copyWith(
                                fontFamily: fontFamily,
                                fontSize: isMobile ? 13 : 15,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Spacer(),
                  // ===== زرار Contact Me =====
                  ElevatedButton.icon(
                        onPressed: () {
                          // TODO: استدعاء الكونتاكت
                          // PortfolioOnePage.scrollToContact();
                        },
                        icon: const Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          locale == "ar" ? "تواصل معي" : "Contact Me",
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 28,
                            vertical: isMobile ? 12 : 16,
                          ),
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 8,
                          shadowColor: AppColors.primary.withOpacity(.5),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .scale(begin: const Offset(.9, .9))
                      .shakeX(duration: 1200.ms, hz: 3, amount: 3),
                ],
              ),
            ),
          ),

          // ===== RIGHT SIDE (صورة الموبايل) =====
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: isMobile ? 220 : (isTablet ? 320 : 420),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                            width: isMobile ? 150 : (isTablet ? 200 : 240),
                            height: isMobile ? 220 : (isTablet ? 320 : 420),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: AppColors.divider,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Center(
                              child: FlutterLogo(
                                size: isMobile ? 80 : (isTablet ? 110 : 140),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(begin: const Offset(.95, .95)),
                      // Positioned(
                      //   bottom: -20,
                      //   right: locale == "ar" ? null : 40,
                      //   left: locale == "ar" ? 40 : null,
                      //   child: const FaIcon(
                      //     FontAwesomeIcons.code,
                      //     color: Colors.cyan,
                      //     size: 28,
                      //   ).animate().fadeIn(duration: 700.ms).slideX(begin: .3),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
