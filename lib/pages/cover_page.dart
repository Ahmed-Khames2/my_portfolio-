import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // 📌 مهم للـ typewriter
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class CoverSection extends StatelessWidget {
  final GlobalKey contactKey; // ✅ متغير جديد

  const CoverSection({super.key, required this.contactKey});

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
        vertical: isMobile ? 0.0 : 70,
        horizontal: isMobile ? 16 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightPrimary.withOpacity(.9),
            AppColors.lightTextPrimary,
          ],
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
                  const SizedBox(height: 40),

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
                          color: AppColors.lightBackground,
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
                          color: AppColors.lightBackground,
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
                            color: AppColors.lightBackground,
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
                            color: AppColors.lightBackground,
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
                      color: AppColors.lightBackground.withOpacity(.9),
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
                                color: AppColors.lightBackground,
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
                                color: AppColors.lightBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Spacer(),
                  // ===== زرار Contact Me =====
                  ElevatedButton.icon(
                        onPressed: () {
                          goTo(contactKey);
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
                          backgroundColor: AppColors.lightPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 8,
                          shadowColor: AppColors.lightPrimary.withOpacity(.5),
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
          MobileImage(isMobile: isMobile, isTablet: isTablet),
        ],
      ),
    );
  }
}

class MobileImage extends StatelessWidget {
  const MobileImage({
    super.key,
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = isMobile ? 150 : (isTablet ? 200 : 240);
    final double phoneHeight = isMobile ? 280 : (isTablet ? 360 : 460);

    return Expanded(
      flex: isMobile ? 0 : 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: phoneHeight,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                      width: phoneWidth,
                      height: phoneHeight,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          color: const Color(0xFF222831), // شاشة غامقة
                          child: Center(
                            child: Icon(
                              Icons.flutter_dash,
                              size: isMobile ? 70 : (isTablet ? 100 : 130),
                              color: const Color(0xFF00ADB5),
                            ),
                          ),
                        ),
                      ),
                    )
                    .animate(
                      onPlay:
                          (controller) => controller.repeat(period: 20.seconds),
                    )
                    .shake(
                      duration: 2.seconds, // يهتز ثانيتين
                      hz: 2,
                      curve: Curves.easeInOut,
                    )
                    .then(delay: 60.seconds), // يفضل ثابت دقيقة
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
