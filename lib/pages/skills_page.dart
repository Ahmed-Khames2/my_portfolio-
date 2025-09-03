import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/cusom_skills_item.dart';
import 'package:my_portfolio2/widgets/skills_category_title.dart';

/* ========================= SKILLS ========================= */
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("skills".tr(context)),
        const SizedBox(height: 20),

        SkillCategoryTitle(
          title: "technical_skills".tr(context),
          icon: Icons.code,
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SkillCard(
              name: "flutter_devm".tr(context),
              level: 0.9,
              icon: Icons.flutter_dash,
              bgColor: Colors.blue,
            ),
            SkillCard(
              name: "android_dev".tr(context),
              level: 0.85,
              icon: Icons.android,
              bgColor: Colors.green,
            ),
            SkillCard(
              name: "java_prog".tr(context),
              level: 0.8,
              icon: Icons.coffee,
              bgColor: Colors.orange,
            ),
            SkillCard(
              name: "python".tr(context),
              level: 0.75,
              icon: Icons.code,
              bgColor: Colors.deepPurple,
            ),
            SkillCard(
              name: "firebase".tr(context),
              level: 0.8,
              icon: Icons.cloud,
              bgColor: Colors.amber,
            ),
            SkillCard(
              name: "rest_api".tr(context),
              level: 0.85,
              icon: Icons.api,
              bgColor: Colors.teal,
            ),
            SkillCard(
              name: "git_github".tr(context),
              level: 0.8,
              icon: Icons.merge_type,
              bgColor: Colors.red,
            ),
            SkillCard(
              name: "uiuxd".tr(context),
              level: 0.7,
              icon: Icons.design_services,
              bgColor: Colors.pink,
            ),
          ],
        ),

        const SizedBox(height: 30),

        // --- Soft Skills ---
        SkillCategoryTitle(
          title: "soft_skills".tr(context),
          icon: Icons.people,
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.red],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SkillCard(
              name: "problem_solving".tr(context),
              level: 0.9,
              icon: Icons.psychology,
              bgColor: Colors.indigo,
            ),
            SkillCard(
              name: "time_management".tr(context),
              level: 0.85,
              icon: Icons.access_time,
              bgColor: Colors.brown,
            ),
            SkillCard(
              name: "teamwork".tr(context),
              level: 0.8,
              icon: Icons.group,
              bgColor: Colors.cyan,
            ),
            SkillCard(
              name: "communication".tr(context),
              level: 0.75,
              icon: Icons.record_voice_over,
              bgColor: Colors.deepOrange,
            ),
            SkillCard(
              name: "adaptability".tr(context),
              level: 0.8,
              icon: Icons.sync_alt,
              bgColor: Colors.greenAccent,
            ),
          ],
        ),
      ],
    );
  }
}
