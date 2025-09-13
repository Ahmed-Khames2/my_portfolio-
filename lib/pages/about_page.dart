import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/SectionTitle.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    // تحديد ألوان النصوص بناء على الوضع
    final primaryTextColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SectionTitle("about_me".tr(context)),
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAboutText(context, t, primaryTextColor, secondaryTextColor),
                    const SizedBox(height: 30),
                    _buildProfileImage(context, isMobile, surfaceColor, secondaryTextColor),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(
                        flex: 2,
                        child: _buildAboutText(context, t, primaryTextColor, secondaryTextColor)),
                    const SizedBox(width: 40),
                    Expanded(
                        flex: 1,
                        child: _buildProfileImage(context, isMobile, surfaceColor, secondaryTextColor)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildAboutText(BuildContext context, TextTheme t, Color primary, Color secondary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: t.bodyLarge?.copyWith(height: 1.6, color: primary),
            children: [
              TextSpan(text: "about_intro".tr(context)),
              TextSpan(
                text: "flutter".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade400),
              ),
              TextSpan(text: "about_mid".tr(context)),
              TextSpan(
                text: "web_frontend".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade400),
              ),
              TextSpan(text: "about_ai".tr(context)),
              TextSpan(
                text: "ai".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple.shade300),
              ),
              TextSpan(text: "about_flutter".tr(context)),
              TextSpan(
                text: "flutter_dart".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade400),
              ),
              TextSpan(text: "about_skills_intro".tr(context)),
              TextSpan(
                text: "skill_cross_platform".tr(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "skill_cross_platform_suffix".tr(context)),
              TextSpan(
                text: "skill_firebase".tr(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: "\n"),
              TextSpan(
                text: "skill_git".tr(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: "\n"),
              TextSpan(
                text: "skill_uiux".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade300),
              ),
              TextSpan(text: "skill_uiux_suffix".tr(context)),
              TextSpan(text: "about_outro".tr(context)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Chip(label: Text("flutter".tr(context), style: TextStyle(color: primary))),
            Chip(label: Text("dart".tr(context), style: TextStyle(color: primary))),
            Chip(label: Text("firebase".tr(context), style: TextStyle(color: primary))),
            Chip(label: Text("rest_api".tr(context), style: TextStyle(color: primary))),
            Chip(label: Text("uiux".tr(context), style: TextStyle(color: primary))),
            Chip(label: Text("git".tr(context), style: TextStyle(color: primary))),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, bool isMobile, Color surface, Color secondary) {
    return Center(
      child: SizedBox(
        width: isMobile ? 220 : 300,
        height: isMobile ? 220 : 300,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: isMobile ? 300 : 380,
                height: isMobile ? 300 : 380,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            Positioned(
              top: -4,
              left: -4,
              child: Container(
                width: isMobile ? 300 : 380,
                height: isMobile ? 300 : 380,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 12, offset: const Offset(0, 6)),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/portfolio.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(.98, .98)),
            ),
          ],
        ),
      ),
    );
  }
}
