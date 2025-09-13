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
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/utils/seperator.dart';
import 'package:my_portfolio2/widgets/cusom_TapBar.dart';
import 'package:my_portfolio2/widgets/cusom_generate_section.dart';
import 'package:my_portfolio2/widgets/custom_fotter.dart';
import 'package:my_portfolio2/widgets/section_widget.dart';

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

  /// Helper function to wrap widgets in SliverToBoxAdapter
  Widget _sliver({Key? key, required Widget child}) {
    return SliverToBoxAdapter(key: key, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        onNav: (section) {
          switch (section) {
            case 'cover':
              goTo(_coverKey);
              break;
            case 'about':
              goTo(_aboutKey);
              break;
            case 'education':
              goTo(_educationKey);
              break;
            case 'skills':
              goTo(_skillsKey);
              break;
            case 'experience':
              goTo(_experienceKey);
              break;
            case 'services':
              goTo(_servicesKey);
              break;
            case 'projects':
              goTo(_projectsKey);
              break;
            case 'achievements':
              goTo(_achievementsKey);
              break;
            case 'contact':
              goTo(contactKey);
              break;
          }
        },
      ),
      body: Stack(
        children: [
          /// 🎨 الخلفية المتحركة
          Positioned.fill(
            child: RepaintBoundary(
              child: CodingBackground(controller: _bgController),
            ),
          ),

          /// 💻 المحتوى باستخدام Slivers
          CustomScrollView(
            controller: _scroll,
            slivers: [
              _sliver(
                key: _coverKey,
                child: Section(
                  maxWidth: 1200,
                  padTop: 0,
                  padBottom: 0,
                  child: CoverSection(contactKey: contactKey),
                ),
              ),
              _sliver(child: SizedBox(height: 20)),

              _sliver(child: Separator()),

              _sliver(
                key: _aboutKey,
                child: Section(child: const AboutSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _educationKey,
                child: Section(child: const EducationSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _skillsKey,
                child: Section(child: const SkillsSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _experienceKey,
                child: Section(child: const ExperienceSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _servicesKey,
                child: Section(child: const ServicesSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _projectsKey,
                child: Section(child: const ProjectsSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: _achievementsKey,
                child: Section(child: AchievementsSection()),
              ),
              _sliver(child: Separator()),

              _sliver(
                key: contactKey,
                child: Section(child: const ContactSection()),
              ),

              _sliver(child: const Footer()),
            ],
          ),
        ],
      ),
    );
  }
}
