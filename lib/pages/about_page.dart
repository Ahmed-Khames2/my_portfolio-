import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700; // أي عرض أقل من 700 يبقى موبايل

    return Column(
      children: [
        SectionTitle("about_me".tr(context)),
        const SizedBox(height: 20),

        // بدل ما نستخدم Row دايمًا → نعمل شرط
        isMobile
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAboutText(context, t),
                const SizedBox(height: 30),
                _buildProfileImage(context, isMobile),
              ],
            )
            : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // النصوص
                Expanded(flex: 2, child: _buildAboutText(context, t)),
                const SizedBox(width: 40),
                // الصورة
                Expanded(flex: 1, child: _buildProfileImage(context, isMobile)),
              ],
            ),
      ],
    );
  }

  /// 🔹 النصوص
  Widget _buildAboutText(BuildContext context, TextTheme t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: t.bodyLarge?.copyWith(height: 1.6),
            children: [
              TextSpan(text: "about_intro".tr(context)),
              TextSpan(
                text: "flutter".tr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: "about_mid".tr(context)),
              TextSpan(
                text: "web_frontend".tr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              TextSpan(text: "about_ai".tr(context)),
              TextSpan(
                text: "ai".tr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              TextSpan(text: "about_flutter".tr(context)),
              TextSpan(
                text: "flutter_dart".tr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              TextSpan(text: "skill_uiux_suffix".tr(context)),
              TextSpan(text: "about_outro".tr(context)),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Skills Chips
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Chip(label: Text("flutter".tr(context))),
            Chip(label: Text("dart".tr(context))),
            Chip(label: Text("firebase".tr(context))),
            Chip(label: Text("rest_api".tr(context))),
            Chip(label: Text("uiux".tr(context))),
            Chip(label: Text("git".tr(context))),
          ],
        ),
      ],
    );
  }

  /// 🔹 صورة البروفايل
  Widget _buildProfileImage(BuildContext context, bool isMobile) {
    return Center(
      child: SizedBox(
        width: isMobile ? 220 : 300,
        height: isMobile ? 220 : 300,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: isMobile ? 300 : 380,
                height: isMobile ? 300 : 380,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.3),
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
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/portfolio.jpg'),

                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .scale(begin: const Offset(.98, .98)),
            ),
          ],
        ),
      ),
    );
  }
}

/*
make this paeبص عايز اخلي الابوت مي رسبونسف علي كل الموبايلات وكمان عايزك تخلي التكيست جاي من اللوكاليزيشن زي  Text(
                        "hi_im".tr(context),) andd add this to ar.json and en.json                  import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/utils/helpers.dart';

// import 'package:my_portfolio/widgets/cusom_clip.dart';

/* ========================= ABOUT ========================= */
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      children: [
        SectionTitle("About Me"),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // النصوص
            Expanded(
              flex: isNarrow ? 0 : 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: t.bodyLarge?.copyWith(height: 1.6),
                      children: [
                        const TextSpan(
                          text:
                              "Hi 👋 I’m Ahmed Khames, a Computer Science student and a dedicated ",
                        ),
                        TextSpan(
                          text: "Flutter Developer",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const TextSpan(
                          text:
                              " with a true passion for building modern, user-friendly, and scalable applications.\n\n",
                        ),

                        const TextSpan(
                          text:
                              "My journey in programming started early with curiosity about how things work in tech. Along the way, I explored different fields like ",
                        ),
                        TextSpan(
                          text: "Web Frontend",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const TextSpan(
                          text: " development and even experimented with ",
                        ),
                        TextSpan(
                          text: "AI",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ", but I quickly realized that my creativity and problem-solving skills shine the most when working with ",
                        ),
                        TextSpan(
                          text: "Flutter & Dart",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const TextSpan(text: ".\n\n"),

                        const TextSpan(
                          text:
                              "Over time, I’ve built a strong skill set that includes:\n",
                        ),
                        TextSpan(
                          text: "• Cross-platform mobile development",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: " with Flutter & Dart\n"),
                        TextSpan(
                          text:
                              "• Firebase integration, REST APIs, and clean architecture\n",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "• Git/GitHub collaboration\n",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "• UI/UX design",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const TextSpan(
                          text:
                              " to deliver polished and engaging user experiences\n\n",
                        ),

                        const TextSpan(
                          text:
                              "What sets me apart is my mix of technical depth and adaptability. I’m not just focused on coding — I’m driven by solving real-world problems, optimizing workflows, and creating digital products that people genuinely enjoy using.\n\n",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Skills Chips
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      Chip(label: Text("Flutter")),
                      Chip(label: Text("Dart")),
                      Chip(label: Text("Firebase")),
                      Chip(label: Text("REST APIs")),
                      Chip(label: Text("UI/UX")),
                      Chip(label: Text("Git / GitHub")),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 40),

            // الصورة مع الخلفية
            Expanded(
              flex: isNarrow ? 0 : 1,
              child: Transform.translate(
                offset: Offset(
                  isNarrow ? 0 : 80,
                  isNarrow ? 0 : 80,
                ), // حرك يمين وتحت
                child: SizedBox(
                  width: double.infinity,
                  height:
                      isNarrow
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // الخلفية متحركة بعيد شوية
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: isNarrow ? 220 : 320,
                          height: isNarrow ? 220 : 320,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      // الكارت الرئيسي قدام
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                              width: isNarrow ? 200 : 300,
                              height: isNarrow ? 200 : 300,
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/profile.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .scale(begin: const Offset(.98, .98)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
 */
