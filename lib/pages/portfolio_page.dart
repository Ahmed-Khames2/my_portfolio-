import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio2/pages/about_page.dart';
import 'package:my_portfolio2/pages/achievements_page.dart';
import 'package:my_portfolio2/pages/contact_page.dart';
import 'package:my_portfolio2/pages/cover_page.dart';
import 'package:my_portfolio2/pages/education_page.dart';
import 'package:my_portfolio2/pages/experience_page.dart';
import 'package:my_portfolio2/pages/projects_page.dart';
import 'package:my_portfolio2/pages/services_page.dart';
import 'package:my_portfolio2/pages/skills_page.dart';
import 'package:my_portfolio2/pages/testmonials_page.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/utils/seperator.dart';
import 'package:my_portfolio2/widgets/cusom_TapBar.dart';
import 'package:my_portfolio2/widgets/cusom_generate_section.dart';
import 'package:my_portfolio2/widgets/custom_fotter.dart';

class PortfolioOnePage extends StatefulWidget {
  const PortfolioOnePage({super.key});
  @override
  State<PortfolioOnePage> createState() => _PortfolioOnePageState();
}

class _PortfolioOnePageState extends State<PortfolioOnePage>
    with TickerProviderStateMixin {
  final _scroll = ScrollController();

  final _coverKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _achievementsKey = GlobalKey();
  final _testimonialsKey = GlobalKey();
  final contactKey = GlobalKey();

  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _scroll.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        onNav: (section) {
          switch (section) {
            case 'Cover':
              goTo(_coverKey);
              break;
            case 'About':
              goTo(_aboutKey);
              break;
            case 'Education':
              goTo(_educationKey);
              break;
            case 'Skills':
              goTo(_skillsKey);
              break;
            case 'Experience':
              goTo(_experienceKey);
              break;
            case 'Services':
              goTo(_servicesKey);
              break;
            case 'Projects':
              goTo(_projectsKey);
              break;
            case 'Achievements':
              goTo(_achievementsKey);
              break;
            case 'Testimonials':
              goTo(_testimonialsKey);
              break;
            case 'Contact':
              goTo(contactKey);
              break;
          }
        },
      ),
      body: Stack(
        children: [
          // 🎨 الخلفية المتحركة مرتبطة بالـ AnimationController
          Positioned.fill(child: CodingBackground(controller: _bgController)),

          // 💻 المحتوى فوق الخلفية
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                Separator(),
                Section(
                  key: _coverKey,
                  maxWidth: 1200,
                  padTop: 0,
                  padBottom: 0,
                  child: SizedBox(
                    width: double.infinity,
                    child: const CoverSection(),
                  ),
                ),
                Separator(),
                Section(key: _aboutKey, child: const AboutSection()),
                Separator(),
                Section(key: _educationKey, child: const EducationSection()),
                Separator(),
                Section(key: _skillsKey, child: const SkillsSection()),
                Separator(),
                Section(key: _experienceKey, child: const ExperienceSection()),
                Separator(),
                Section(key: _servicesKey, child: const ServicesSection()),
                Separator(),
                Section(key: _projectsKey, child: const ProjectsSection()),
                Separator(),
                Section(
                  key: _achievementsKey,
                  child:  AchievementsSection(),
                ),
                Separator(),
                Section(
                  key: _testimonialsKey,
                  child: const TestimonialsSection(),
                ),
                Separator(),
                Section(key: contactKey, child: const ContactSection()),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
